

\> ./cookbook-list-dependencies 
Usage: cookbook-list-dependecies <cookbook-path> <cookbook name>

\> ./cookbook-list-dependencies ~/chef/cookbooks myApp
depends 'base', '= 0.1.20'
depends 'hostsfile', '= 0.2.27'
depends 'yum', '= 2.1.18'
depends 'chef_handler', '= 1.1.26'
depends 'yumrepo', '= 0.16.29'
depends 'sudo', '= 2.1.20'
depends 'rsyslog', '= 1.5.15'
depends 'ntp', '= 1.3.25'
depends 'hostname', '= 0.2.21'
depends 'splunk', '= 0.1.17'
depends 'lvm', '= 0.8.29'
depends 'timezone', '= 0.2'
depends 'sysctl', '= 0.3.14'
depends 'postgresql', '= 0.99.22'
depends 'openssl', '= 1.0.18'
depends 'heartbeat', '= 1.0.18'

Then you can use these constrains in your application cookbook,

./cookbook-list-dependencies ~/chef/cookbooks myApp >> ~/chef/cookbooks/myApp/metadata.rb

Upload these cookbooks into your chef-server, use berkshelf or whatever
then constrain the environment for your top myApp cookbook.

Converge the node and the chef-client will download the cookbook MyApp and the metadata.rb constrained cookbooks



