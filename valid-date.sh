#!/bin/bash

num_var=$#
if [ $num_var -ne 3 ]
then
  echo "입력값 오류"
  exit 1
fi



case $1 in
  jan|january|1) month="Jan";;
  feb|february|2) month="Feb";;
  mar|march|3) month="Mar";;
  apr|april|4) month="Apr";;
  may|5) $month="May";;
  jun|june|6) month="Jun";;
  jul|july|7) month="Jul";;
  aug|august|8) month="Aug";;
  sep|september|9) month="Sep";;
  oct|october|10) month="Oct";;
  nov|november|11) month="Nov";;
  dec|december|12) month="Dec";;
  *) month="Invalid";;
esac

if [ month == "Invalid" ]
then
  echo "입력 월이 유효하지 않습니다."
  exit 1
fi

year=$3
yoon_flag=1

if [ $((year%4)) -eq 0 ]
then
  if [ $((year%100)) -ne 0 ]
  then
    yoon_flag=0
  else
    if [ $((year%400)) -eq 0 ]
    then
      yoon_flag=0
    fi
  fi
fi

day=$2

case $month in
  Jan|Mar|May|Jul|Aug|Oct|Dec)
    if [ $day -lt 1 -o $day -gt 31 ]
    then
      echo "$month월은 31일까지 있습니다. 유효하지 않은 날짜입니다."
      exit 1
    fi
    ;;
    
  Apr|Jun|Sep|Nov)
    if [ $day -lt 1 -o $day -gt 30 ]
    then
      echo "$month월은 30일까지 있습니다. 유효하지 않은 날짜입니다."
      exit 1
    fi
    ;;
    
  Feb)
    if [ $yoon_flag -eq 0 ]; then
      if [ $day -lt 1 -o $day -gt 29 ]
      then
        echo "$year 년 2월은 윤달이므로 29일까지 있습니다. 입력한 날짜는 유효하지 않습니다."
        exit 1
      fi
    else
      if [ $day -lt 1 -o $day -gt 28 ]; then
        echo "$year 년 2월은 28일까지 있습니다. 입력한 날짜는 유효하지 않습니다."
        exit 1
      fi
    fi
    ;;
esac

echo "월:$month 날짜:$day 연도:$year"
echo "위 날짜는 유효한 날짜입니다."