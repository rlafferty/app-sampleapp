#
# Cookbook:: app-sampleapp
# Spec:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04']
  }
}

describe 'app-sampleapp::git' do
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

        it 'updates apt repo' do
          expect(chef_run).to update_apt_update('update_repo')
        end

        it 'installs git package' do
          expect(chef_run).to install_package('git')
        end
      end
    end
  end
end
