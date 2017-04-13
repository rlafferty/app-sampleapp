#
# Cookbook:: pm-netdata
# Spec:: install_netdata_nginx
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04']
  }
}

describe 'app-sampleapp::netdata' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "running on: #{platform} #{version}" do
        let(:file_cache_path) { Chef::Config[:file_cache_path] }
        let(:chef_run) do
          ChefSpec::ServerRunner.new(
            platform: platform,
            version: version
          ).converge(described_recipe)
        end

        it 'converges successfully' do
          expect { :chef_run }.to_not raise_error
        end

        it 'installs netdata' do
          expect(chef_run).to install_netdata('netdata')
        end
      end
    end
  end
end
