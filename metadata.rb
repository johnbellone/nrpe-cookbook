name 'nrpe-ng'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
description 'Application cookbook which installs and configures NRPE.'
long_description 'Application cookbook which installs and configures NRPE.'
version '1.0.0'
issues_url 'https://github.com/johnbellone/nrpe-ng-cookbook/issues'
source_url 'https://github.com/johnbellone/nrpe-ng-cookbook'

supports 'centos', '>= 5.8'
supports 'redhat', '>= 5.8'
supports 'ubuntu', '>= 12.04'
supports 'aix', '>= 7.1'
supports 'freebsd', '>= 10.1'
supports 'solaris2', '>= 5.11'

depends 'build-essential'
depends 'dpkg_autostart'
depends 'poise', '~> 2.7'
depends 'poise-archive', '~> 1.3'
depends 'poise-service', '~> 1.0'
