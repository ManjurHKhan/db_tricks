#!/usr/bin/env bash

sudo apt-get remove mysql-server
dpkg -l|grep mysql
sudo apt-get purge mysql-server
sudo apt-get autoremove
sudo mv /var/lib/mysql /var/lib/mysql_old_backup
sudo apt-get purge mysql-server
sudo service mysql stop
sudo killall -KILL mysql mysqld_safe mysqld
sudo apt-get --yes purge mysql-server mysql-client
sudo apt-get --yes autoremove --purge
sudo apt-get autoclean
sudo deluser --remove-home mysql
sudo delgroup mysql
sudo rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
rm ~/.mysql_history
awk -F : '{ print($6 "/.mysql_history"); }' /etc/passwd | xargs -r -d '\n' -- sudo rm -f --
sudo apt-get autoclean
sudo apt-get remove --purge *mysql\*
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -rf /var/lib/mysql
dpkg -l|grep mysql

