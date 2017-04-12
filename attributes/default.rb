# git attributes
# node['app-sampleapp']['git']['version']

# postgres attributes
default['app-sampleapp']['postgres']['database-name'] = 'test_db'
default['app-sampleapp']['postgres']['owner-name'] = 'postgres'

# python attributes
default['pm-poise-python']['python']['runtime-name'] = 'app-sampleapp'
default['pm-poise-python']['python']['version'] = '3'
default['pm-poise-python']['python']['virtualenv-location'] = '/opt/app'

# web attributes
default['nginx']['default_root'] = '/opt/site'
default['app-sampleapp']['nginx']['conf_template'] = 'web/web.conf.erb'
default['app-sampleapp']['nginx']['conf_cookbook'] = 'app-sampleapp'
