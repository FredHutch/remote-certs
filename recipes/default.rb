#
# Cookbook Name:: remote-certs
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

execute 'install_cert' do
  command node['remote-certs']['update_command']
  action :nothing
end

tld = '/usr/share/ca-certificates'
org = node['remote-certs']['organization']
name = node['remote-certs']['name']

# create organization subdirectory for certificate
directory "#{tld}/#{org}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Install file into certificates directory
remote_file "#{tld}/#{org}/#{name}" do
  source node['remote-certs']['source']
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

# Update the certificates configuration with the new cert
append_if_no_line 'add certificate to config' do
  path '/etc/ca-certificates.conf'
  line "#{org}\/#{name}"
  notifies :run, 'execute[install_cert]', :delayed
end
