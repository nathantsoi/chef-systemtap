node['systemtap']['dependencies']['packages'].each do |package|
  package package do
    action :install
  end
end

bash 'download_elfutils' do
  cwd '/tmp'
  code <<-EOS
    wget #{node['systemtap']['elfutils']['source']['url']}
    tar -xjf elfutils-#{node['systemtap']['elfutils']['source']['version']}.tar.bz2
  EOS
  not_if do
    ::File.exists?("/tmp/elfutils-#{node['systemtap']['elfutils']['source']['version']}")
  end
end

bash 'build_systemtap' do
  code <<-EOS
    wget #{node['systemtap']['source']['url']}
    tar -xzf systemtap-#{node['systemtap']['source']['version']}.tar.gz
    cd systemtap-#{node['systemtap']['source']['version']}/
    ./configure #{node['systemtap']['source']['default_configure_flags'].join(' ')}
    make -j#{node['cpu']['total']}   # compile on all CPU cores available
    sudo make install
  EOS
  not_if do
    `/opt/stap/bin/stap -V 2>&1|perl -n -e '/version ([\\d.]+)/ && print "$1"'`.strip == node['systemtap']['source']['version']
  end
end

git node['systemtap']['tools']['prefix'] do
  repository node['systemtap']['tools']['git_repo']
  revision "master"
  action :sync
  only_if { node['systemtap']['nginx']['tools']}
end


