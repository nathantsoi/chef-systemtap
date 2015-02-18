## Description

installs github.com/openresty/nginx-systemtap-toolkit and systemtap on ubuntu, tested on 14.04

the default install path is

```
node['systemtap']['tools']['prefix'] = '/opt/nginx-tools'
```

set to install only systemtap set, skipping nginx-systemtap-toolkit

```
node['systemtap']['tools']['clone'] = false
node['systemtap']['flamegraph']['clone']= false
```
