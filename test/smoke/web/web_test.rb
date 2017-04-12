# # encoding: utf-8

# Inspec test for recipe app-sampleapp::web

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(80) do
  it { should be_listening }
end

describe service('nginx') do
  it { should be_running }
end

describe file('/opt/site') do
  it { should exist }
  it { should be_directory }
end

describe command('curl http://localhost/') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should include 'Hello World' }
end
