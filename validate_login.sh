#!/bin/bash

# Decriiption: Validate login details script
# Author:Elena Pashkova

read -p "Enter a username: " USERNAME
read -p "Enter a password: " PASSWORD

if [[ "$USERNAME" == "admin" && "$PASSWORD" == "secret" ]]; then
 echo "Successfull login"
else
 echo "Login failure!"
fi
