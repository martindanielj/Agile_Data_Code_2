#!/usr/bin/env bash

echo ""
echo "Killing all ssh tunnels!"
ps aux|grep 'ssh -N -i ~/.ssh/my_test_key'|grep -v grep|tr -s ' '|cut -d ' ' -f2|xargs kill
echo "All ssh tunnels killed..."
echo ""
