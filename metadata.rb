name 'certs'
maintainer 'Scientific Computing'
maintainer_email 'scicomp@fhcrc.org'
license 'all_rights'
description 'Installs Certificates'
long_description 'Installs Certificates from HTTP Server for use by OpenSSL'
version '0.1.1'

attribute 'organization',
    :display_name => 'Organization Name',
    :description  => 'The name of the organization that owns the certificate',
    :type         => 'string',
    :required     => 'required',
    :default      => 'organization'

attribute 'source',
    :display_name => 'URL containing source',
    :description  => 'URL for the certificate source',
    :type         => 'string',
    :required     => 'required'

attribute 'name',
    :display_name => 'Certificicate Name',
    :description  => 'Name for the certificate on the host',
    :type         => 'string',
    :required     => 'required'

attribute 'update_command',
    :display_name => 'CA Update Command',
    :description  => 'Command used to update CA chain',
    :type         => 'string',
    :required     => 'required',
    :default      => '/usr/sbin/update-ca-certificates -f'

