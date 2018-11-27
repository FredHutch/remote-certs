
Cookbook for installing certificates via `remote_file` to a host's local
certificate list

> Moving attributes here as this is no longer coture in metadata.rb - will fix tthis up one day... maybe
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

