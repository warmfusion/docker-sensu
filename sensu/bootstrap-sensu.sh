#/bin/bash

echo "Creating run-time configuration from environment variables..."
/opt/sensu/embedded/bin/ruby /bootstrap-sensu-config.rb

echo "Starting $(basename $1)..."
$@