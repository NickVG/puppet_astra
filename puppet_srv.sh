puppet-srv
#!/bin/bash
vim /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/               buster         main contrib non-free" >> /etc/apt/sources.list
vim /etc/apt/preferences.d/smolensk
apt update
wget https://apt.puppet.com/puppet7-release-buster.deb
dpkg -i puppet7-release-buster.deb
echo "export PATH=$PATH:/opt/puppetlabs/bin" >> .bashrc
. .bashrc

apt update
apt-get install puppetserver
vim /etc/default/puppetserver

root@puppet-01:~# puppet config set server puppet-srv.loc --section main
