#!/bin/bash

time=$(date +%H)
echo 현재 시각 $time


if [ $time -ge 0 -a $time -lt 9 ]
then
  echo 굿모닝
  exit 0
elif [ $time -ge 9 -a $time -lt 17 ]
then
  echo 굿애프터눈
  exit 1
else
  echo 굿이브닝
  exit 2
fi

