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

describe 'app-sampleapp::default' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "on #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(
            platform: platform,
            version: version
          ).converge(described_recipe)
        end

        before do
          stub_command(%r{ls \/.*\/recovery.conf}).and_return(false)
        end

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end
      end
    end
  end
end
