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

describe 'app-sampleapp::python' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "on #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform, version: version) do |node|
            node.default['pm-poise-python']['python']['runtime-name'] = 'app-sampleapp'
            node.default['pm-poise-python']['python']['version'] = '3'
            node.default['pm-poise-python']['python']['virtualenv-location'] = '/opt/app'
          end.converge(described_recipe) end

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end

        it 'includes the pm-poise-python default recipe' do
          expect(chef_run).to include_recipe('pm-poise-python::default')
        end

        it 'installs python' do
          expect(chef_run).to install_python_runtime('app-sampleapp').with(version: '3')
        end

        it 'creates python virtual env' do
          expect(chef_run).to create_python_virtualenv('/opt/app')
        end

        it 'installed virtualenv package' do
          expect(chef_run).to install_python_package('virtualenv')
        end
      end
    end
  end
end
