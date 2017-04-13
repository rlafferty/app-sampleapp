#
# Cookbook:: app-sampleapp
# Recipe:: netdata
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

netdata 'netdata' do
  nginx_config true
  action :install
end
