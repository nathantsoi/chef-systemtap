default['systemtap']['nginx']['tools'] = true

# Package Dependencies
default['systemtap']['dependencies']['packages'] = %w/build-essential zlib1g-dev elfutils libdw-dev gettext/

# Download data
default['systemtap']['elfutils']['source']['version']   = '0.161'
default['systemtap']['elfutils']['source']['url']       = "https://fedorahosted.org/releases/e/l/elfutils/0.161/elfutils-#{node['systemtap']['elfutils']['source']['version']}.tar.bz2"
default['systemtap']['elfutils']['source']['checksum']  = '570c91a1783fa5386aaa2dfdd08dda1de777c2b63bf3b9c1437d635ffdd7a070'

default['systemtap']['source']['version']   = '2.6'
default['systemtap']['source']['url']       = "https://sourceware.org/systemtap/ftp/releases/systemtap-#{node['systemtap']['source']['version']}.tar.gz"
default['systemtap']['source']['checksum']  = '9ff5d27602f65b8ad3b8165e48cc562638e5d7f22ff0238618dfb3be168ef151'

default['systemtap']['tools']['git_repo']   =  'https://github.com/openresty/nginx-systemtap-toolkit.git'

# Directories
default['systemtap']['source']['prefix']    = '/opt/stap'
default['systemtap']['tools']['prefix']     = '/opt/nginx-tools'

# Configure flags
default['systemtap']['source']['default_configure_flags'] = [
  "--prefix=#{node['systemtap']['source']['prefix']}",
  '--disable-docs',
  '--disable-publican',
  '--disable-refdocs CFLAGS="-g -O2"',
  "--with-elfutils=/tmp/elfutils-#{node['systemtap']['elfutils']['source']['version']}"
]
