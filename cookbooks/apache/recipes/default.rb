#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform']
when "centos"
  service_name = 'httpd'
  package_name = 'httpd'
  mod_dir = "/usr/lib64/httpd/modules"
when "ubuntu"
  service_name = 'apache2'
  package_name = 'apache2'
  mod_dir = "/usr/lib/apache2/modules"
else
  mod_dir = "/usr/lib64/httpd/modules"
end

package package_name

service service_name do
  action [:start, :enable]
end

ohai_plugin 'apache' do
  resource :template
  variables mod_path: mod_dir
end
