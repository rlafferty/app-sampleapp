name 'app-sampleapp'
maintainer 'PhishMe'
maintainer_email 'ross.lafferty@gmail.com'
license 'all_rights'
description 'Installs/Configures app-sampleapp'
long_description 'Installs/Configures app-sampleapp'
version '1.0.0'

supports 'debian'

chef_version '>= 12.5' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/app-sampleapp/issues'
# if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/app-sampleapp'
# if respond_to?(:source_url)

depends 'pm-postgresql'
depends 'pm-poise-python'
depends 'pm-nginx'
depends 'pm-netdata'
