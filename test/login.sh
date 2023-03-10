#!/bin/bash

# VARIABLES
admin_name="alex"
admin_pass="1234"
echo "Enter name (1/2): "
read name 
echo "Enter password (2/2): "
read password 
#read name name2 name3
echo "Enterd names : $name"
if [ $name == $admin_name ] && [ $password == $admin_pass ]
    then 
    echo "Welcome $name"
    exec ./run.sh
    sleep 1
else
    echo "You are not $admin_name all access has been revoked"
    sleep 1
fi
