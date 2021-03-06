require 'spec_helper'

# Check for presence of certificate in global certs file
describe command(
  %w(
    openssl verify
    -CAfile /etc/ssl/certs/ca-certificates.crt
    /var/tmp/sample_certs/cert.pem
  )
) do
  its(:stdout) { should_not match(/error/) }
end
