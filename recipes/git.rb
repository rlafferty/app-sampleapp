#
# Cookbook:: app-sampleapp
# Recipe:: git
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

apt_update 'update' do
  action :update
end

package 'git'
