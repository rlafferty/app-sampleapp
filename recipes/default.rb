#
# Cookbook:: app-sampleapp
# Recipe:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

%w(git python postgres web netdata).each do |recipe|
  include_recipe "app-sampleapp::#{recipe}"
end
