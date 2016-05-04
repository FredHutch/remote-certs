require 'spec_helper'

# Check for presence of certificate in global certs file
describe command('openssl verify -CAfile /etc/ssl/certs/ca-certificates.crt /var/tmp/sample_certs/sample.crt') do
    its(:stdout) { should match /OK/ }
end
