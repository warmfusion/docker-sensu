#!/opt/sensu/embedded/bin/ruby
# 
# Allows sensu to accept a few environment variables as configuration paths for
# some of the dependent systems.
#
# A URI is parsed into a configuration block by creating a json file named after the environment
# variable.
#
# Supported Variables (with example)
#
#  SENSU_TRANSPORT - rabbitmq://sensu:sensu@localhost:5672/?vhost=sensu&timeout=10&ssl.private_key_file=/etc/sensu/ssl/sensu.key.pem&ssl.cert_chain_file=/etc/sensu/ssl/sensu.crt.pem
#  SENSU_API       - api://localhost:4566/?bind=0.0.0.0
#  SENSU_REDIS     - redis://localhost:6369/
#
# Author: Toby Jackson <toby@warmfusion.co.uk>
#
# License: MIT
#

require 'uri'
require 'json'

# Needed a deep-merge operation so multiple nested querystring pairs can 
# get merged into the returning hash alongside eachother
class ::Hash
    def deep_merge!(second)
        merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
        self.merge!(second.to_h, &merger)
    end
end

#
def url_to_hash( uri, default = {} )
  hash = default
  begin
    uri = URI( uri )
  rescue Exception => e
    puts "Unable to parse URI variable: #{uri} #{e}"
    throw e
  end

  t_type = uri.scheme
  hash[t_type] = {}

  hash[t_type]['host'] = uri.host unless uri.host.nil?
  hash[t_type]['port'] = uri.port unless uri.port.nil?

  unless uri.userinfo.nil?
    hash[t_type]['username'] = uri.userinfo.split(':').first
    hash[t_type]['password'] = uri.userinfo.split(':').last if uri.userinfo.include? ':'
  end

  # Additional query string values are added to the configuration hash
  unless uri.query.nil?
    uri.query.split('&').each do |keypair|
      key, value = keypair.split('=')
      # This line is clever; it takes a key with a dot-separated string and turns it into
      # a nested hash, eg ssl.private_key_file=/etc/my.key will get turned into
      # { "ssl" => { "private_key_file" => "/etc/my.key" } }
      hash[t_type].deep_merge! (key.split(".") << value).reverse.inject{|a,n| {n=>a}}
    end
  end
  return hash
end


# Might be nicer to have this as an argument...
%w{ SENSU_TRANSPORT SENSU_API SENSU_CLIENT SENSU_REDIS }.each do |env|
  next if  ENV[env].nil?

  puts "# JSON configured from #{env} environment variable..."  
  config = url_to_hash ENV[env]
  
  puts JSON.pretty_generate(config)

  File.open("/etc/sensu/conf.d/#{env}.json","w") do |f|
    f.write(JSON.pretty_generate(config) )
    f.close
  end
end


