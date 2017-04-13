describe service('netdata') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('19999') do
  it { should be_listening }
end

describe port('8080') do
  it { should be_listening }
end

describe command('curl http://localhost:8080') do
  its(:stdout) { should include '<title>netdata dashboard</title>'}
end
