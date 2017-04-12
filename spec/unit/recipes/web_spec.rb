#
# Cookbook:: app-sampleapp
# Spec:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04'],
  },
}

describe 'app-sampleapp::web' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "on #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(
            platform: platform,
            version: version
          ).converge(described_recipe)
        end

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end

        it 'should include the pm-nginx::default recipe' do
          expect(chef_run).to include_recipe('pm-nginx::default')
        end

        it 'should enable the new nginx site' do
          expect(chef_run).to enable_nginx_site('sampleapp')
        end
      end
    end
  end
end
