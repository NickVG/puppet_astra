puppet-srv
#!/bin/bash
sudo apt install debian-archive-keyring 

vim /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/               buster         main contrib non-free" >> /etc/apt/sources.list
echo "deb https://security.debian.org/debian-security/ buster/updates main contrib non-free" >> /etc/apt/sources.list
rm /etc/apt/preferences.d/smolensk
sudo apt update
vim /etc/apt/preferences.d/smolensk
apt update
wget https://apt.puppet.com/puppet7-release-buster.deb
dpkg -i puppet7-release-buster.deb
echo "export PATH=$PATH:/opt/puppetlabs/bin" >> .bashrc
. .bashrc

apt update
apt-get install puppetserver
vim /etc/default/puppetserver

#AGENT
apt-get install puppet-agent
puppet config set server astra01.test.local --section main

