#!/bin/bash
service mysqld restart
sleep 10
mysql -u root -e 'create database relay;'
mysql -u root -e "grant all on relay.* to 'relay'@'%' identified by 'relayDbUser'"