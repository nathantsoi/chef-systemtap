name              'systemtap'
maintainer        'Nathan Tsoi'
maintainer_email  'nathan@vertile.com'
license           'Apache 2.0'
description       'installs github.com/openresty/nginx-systemtap-toolkit and systemtap on ubuntu, tested on 14.04'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md')).chomp
version           IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp rescue '0.1.0'

recipe 'systemtap', 'installs github.com/openresty/nginx-systemtap-toolkit and systemtap on ubuntu, tested on 14.04'

%w{ ubuntu }.each do |os|
  supports os
end

depends 'build-essential'
depends 'ohai', '>= 1.1.4'
depends 'apt'
depends 'git'
