# # encoding: utf-8

# Inspec test for recipe app-sampleapp::python

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/opt/app') do
  it { should exist }
  it { should be_directory }
end

describe command('/opt/app/bin/python -V') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should include 'Python 3' }
end
