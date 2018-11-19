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

# create organization subdirectory for certificate
directory "/usr/share/ca-certificates/#{node['remote-certs']['organization']}" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# Install file into certificates directory
remote_file "/usr/share/ca-certificates/#{node['remote-certs']['organization']}/#{node['remote-certs']['name']}" do
    source node['remote-certs']['source']
    owner 'root'
    group 'root'
    mode '0644'
    action :create
end

# Update the certificates configuration with the new cert
ruby_block 'add_line' do
    block do
        file = Chef::Util::FileEdit.new('/etc/ca-certificates.conf')
        file.insert_line_if_no_match(
            "/#{node['remote-certs']['organization']}/",
            "#{node['remote-certs']['organization']}/#{node['remote-certs']['name']}"
        )
        file.write_file
    end
    notifies :run, 'execute[install_cert]', :immediately
end
