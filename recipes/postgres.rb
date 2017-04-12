#
# Cookbook:: app-sampleapp
# Recipe:: postgres
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

include_recipe 'pm-postgresql::server'

pg_database 'test_db' do
  owner 'postgres'
  action :create
end
