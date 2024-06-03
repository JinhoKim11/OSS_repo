#!/bin/bash

while true
do
  users=$( who )
  
  for user in $users
  do
    echo "$user 로그인함!"
  done
  
  sleep 60
done