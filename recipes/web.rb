#
# Cookbook:: app-sampleapp
# Recipe:: web
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

include_recipe 'pm-nginx'

nginx_site 'sampleapp' do
  template node['app-sampleapp']['nginx']['conf_template']
  cookbook node['app-sampleapp']['nginx']['conf_cookbook']
  action :enable
end

file "#{node['nginx']['default_root']}/index.html" do
  content '<h1>Hello World</h1>'
end
