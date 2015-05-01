Usage:

from a existing Top-Level application cookbook,

    \>cat Berksfile
    source 'https://supermarket.chef.io'

    metadata

    cookbook 'file',
      git: 'git@github.com:jenssegers/chef-file.git'


Then vendor all the cookbooks used by this cookbook in /tmp/cookbooks

    \>bundle exec berks vendor /tmp/cookbooks
    Resolving cookbook dependencies...
    Fetching 'myApp' from source at .
    Using myApp (0.1.21) from source at .
    Using apt (2.7.0)
    Using chef-client (4.3.0)
    Using chef-sugar (3.1.0)
    Using chef_handler (1.1.6)
    Using cron (1.6.1)
    Using file (2.0.0) from git@github.com:jenssegers/chef-file.git (at master)
    Using iptables (1.0.0)
    Using java (1.31.0)
    Using logrotate (1.9.1)
    Using openssh (1.3.4)
    Using rsyslog (1.15.0)
    Using tar (0.6.0)
    Using windows (1.36.6)
    Using yum (3.6.0)
    Vendoring myApp (0.1.21) to /tmp/cookbooks/myApp
    Vendoring apt (2.7.0) to /tmp/cookbooks/apt
    Vendoring chef-client (4.3.0) to /tmp/cookbooks/chef-client
    Vendoring chef-sugar (3.1.0) to /tmp/cookbooks/chef-sugar
    Vendoring chef_handler (1.1.6) to /tmp/cookbooks/chef_handler
    Vendoring cron (1.6.1) to /tmp/cookbooks/cron
    Vendoring file (2.0.0) to /tmp/cookbooks/file
    Vendoring iptables (1.0.0) to /tmp/cookbooks/iptables
    Vendoring java (1.31.0) to /tmp/cookbooks/java
    Vendoring logrotate (1.9.1) to /tmp/cookbooks/logrotate
    Vendoring openssh (1.3.4) to /tmp/cookbooks/openssh
    Vendoring rsyslog (1.15.0) to /tmp/cookbooks/rsyslog
    Vendoring tar (0.6.0) to /tmp/cookbooks/tar
    Vendoring windows (1.36.6) to /tmp/cookbooks/windows
    Vendoring yum (3.6.0) to /tmp/cookbooks/yum

and find out the exact list of versions being used by this top-level cookbook

    \>cookbook-list-dependencies /tmp/cookbooks/ myApp
    depends 'apt', '2.7.0'
    depends 'chef-client', '4.3.0'
    depends 'chef-sugar', '3.1.0'
    depends 'cron', '1.6.1'
    depends 'file', '2.0.0'
    depends 'java', '1.31.0'
    depends 'logrotate', '1.9.1'
    depends 'openssh', '1.3.4'
    depends 'rsyslog', '1.15.0'
    depends 'tar', '0.6.0'
    depends 'windows', '1.36.6'
    depends 'yum', '3.6.0'

Then you can use these constrains in your application cookbook,

    \>cookbook-list-dependencies /tmp/cookbooks myApp >> metadata.rb

Upload these cookbooks into your chef-server, use berkshelf or whatever
then constrain the environment for your top myApp cookbook.

Converge the node and the chef-client will download the cookbook MyApp and the metadata.rb constrained cookbooks



