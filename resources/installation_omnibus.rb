#
# Cookbook: blp-nrpe
# License: Apache 2.0
#
# Copyright 2015-2017, Bloomberg Finance L.P.
#

include NrpeCookbook::Resource

provides :nrpe_installation_omnibus
provides :nrpe_installation do |node|
  node['nrpe']['install']['provider'] == 'omnibus'
end

property :package_source, [String, Array], required: true
property :service_user, String, default: 'nrpe'
property :service_group, String, default: 'nrpe'
property :nrpe_program, String, required: true
property :nrpe_plugins, String, default: '/etc/nagios/nrpe.d'

action :install do
  directory new_resource.nrpe_plugins do
    recursive true
    owner new_resource.service_user
    group new_resource.service_group
    mode '0775'
  end

  package_file = remote_file ::File.basename(new_resource.package_source) do
    path ::File.join(Chef::Config[:file_cache_path], name)
    source new_resource.package_source
    backup false
  end

  package "install #{new_resource.package_name}" do
    package_name new_resource.package_name
    source package_file.path
  end
end

action :uninstall do
  package "uninstall #{new_resource.package_name}" do
    action :remove
  end
end
