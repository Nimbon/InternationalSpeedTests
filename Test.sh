#!/bin/sh

# Fetch Server List
echo ''
echo Refreshing Servers
./speedtest.py --list > server.list

# Run Speed Tests#

while read locations;
do
echo ''
echo '' >> log
date >> log
echo 'Running Speed Test'
echo "$locations"
echo 'Running Speed Test' >> log
echo "$locations" >> log
./speedtest.py --share --server $(grep -i "$locations" server.list | head -n 1 | awk -F ')' '{print $1}') >> log
done <locations.txt