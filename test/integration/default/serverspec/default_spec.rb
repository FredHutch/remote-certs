require 'spec_helper'

describe 'hutch-certs::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'installs certificates' do
      # check that dummy certificates are installed
      # - generate dummy cert
      # - install using default
      # - verify presence in cert chain
      skip 'Replace this with meaningful tests'
  end
end
