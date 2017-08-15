#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd'

service 'httpd' do
  action [:start, :enable]
end

ohai_plugin 'apache'
