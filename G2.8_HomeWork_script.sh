#!/bin/bash

/bin/echo 'Creating users'
sudo useradd admin
sudo useradd bk1
sudo useradd sk1
sudo useradd dev1

/bin/echo 'Creating groups'
sudo groupadd bookkeepers
sudo groupadd storekeepers
sudo groupadd developers

/bin/echo 'Adding users to groups'
sudo usermod -aG bookkeepers bk1
sudo usermod -aG storekeepers sk1
sudo usermod -aG developers dev1

/bin/echo 'Clear resorces'
cd ~/
sudo rm -Rf /var/data

/bin/echo 'Making directories'
sudo mkdir /var/data
cd /var/data
sudo mkdir invoices
sudo mkdir web
sudo mkdir store

/bin/echo 'All privileges for admin in /var/data (recursively)'
sudo chown -R admin:admin /var/data

/bin/echo 'Change groups in /var/data/... (recursively)'
sudo chown -R admin:bookkeepers /var/data/invoices
sudo chown -R admin:developers /var/data/web
sudo chown -R admin:storekeepers /var/data/store

/bin/echo 'Change privileges: owner+rwx, group+rwx, other+r in /var/data/... (recursively)'
sudo chmod -R 774 /var/data/invoices
sudo chmod -R 774 /var/data/web
sudo chmod -R 774 /var/data/store

/bin/echo 'Users bk1, sk1, dev1 need to set password...'
