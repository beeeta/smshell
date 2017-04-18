#!/bin/sh

# find programs pid by name
ps -ef | grep name

# find programs port by pid
netstat -anp|grep pid

#find programs pid by its port
lsof -i:portnum
