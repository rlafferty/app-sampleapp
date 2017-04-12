#
# Cookbook:: app-sampleapp
# Recipe:: postgres
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

include_recipe 'pm-postgresql::server'

pg_database node['app-sampleapp']['postgres']['database-name'] do
  owner node['app-sampleapp']['postgres']['owner-name']
  action :create
end
