#!/bin/bash
count=$#
echo "입력한 숫자 갯수 $count"
if [ $count -eq 0 ]
then
  echo "전달된 인수가 없습니다."
  exit 1
elif [ $count -eq 1 ]
then 
  echo "프로그램 실행"
  
else
  echo "인수가 많습니다."
  exit 2
fi
case $1 in
1) echo January;;
2) echo Feb;;
3) echo Mar;;
4) echo Apr;;
5) echo May;;
6) echo Jun;;
7) echo Jul;;
8) echo Aug;;
9) echo Sep;;
10) echo Oct;;
11) echo Nov;;
12) echo Dec;;
esac