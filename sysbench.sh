#!/bin/bash

sudo apt-get update

sudo apt update

sudo apt-get install sysbench -y

sysbench --test=cpu --cpu-max-prime=20000 run > cpu_docker.txt

sysbench --test=cpu --cpu-max-prime=20000 run > cpu_vm.txt

sysbench --test=fileio --file-total-size=64G prepare

sysbench --test=fileio --file-total-size=64G --file-test-mode=rndrw --max-time=300 --max-requests=0 run > file_io_docker.txt

sysbench --test=fileio --file-total-size=64G --file-test-mode=rndrw --max-time=300 --max-requests=0 run > file_io_vm.txt

sysbench --test=fileio --file-total-size=64G cleanup


###### Export server specs

sudo apt-get update -y && sudo apt-get install lshw -y

sudo lshw -html > mySpecs.html



sysbench /usr/share/sysbench/oltp_read_write.lua \
--mysql-host=127.0.0.1 --mysql-port=3306 \
--mysql-user=atldbuser --mysql-password="x0LpZpJOj1PUvQo32gT5W-eV" \
--mysql-db=atldb --db-driver=mysql --tables=3 --table-size=10000000  prepare

sysbench /usr/share/sysbench/oltp_read_write.lua \
--table-size=10000000 \
--mysql-host=127.0.0.1 --mysql-port=3306 \
--db-driver=mysql --mysql-db=atldb --mysql-user=atldbuser --mysql-password="x0LpZpJOj1PUvQo32gT5W-eV" \
--max-time=60 --max-requests=0 --num-threads=8 run > mysql_vm_new.txt


sysbench /usr/share/sysbench/oltp_read_write.lua --mysql-host=127.0.0.1 --mysql-port=3306 --db-driver=mysql --mysql-db=atldb --mysql-user=atldbuser --mysql-password="x0LpZpJOj1PUvQo32gT5W-eV" cleanup
