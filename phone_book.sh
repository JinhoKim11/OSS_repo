#!/bin/bash

# 전화번호부 파일 경로
phone_book="book.txt"

# 인수 2개 아니면 종료
if [ $# -ne 2 ]; then
    echo "이름과 전화번호가 입력되지 않았습니다."
    exit 1
fi

name="$1"
phone="$2"

# 전화번호 형식 확인
if [[ ! $phone =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
    echo "전화번호는 000-0000-0000 형식으로 입력해야 합니다."
    exit 1
fi


area_code=$(echo $phone | awk -F- '{print $1}') #-로 구분한 필드중 첫번째 필드만 가져오기

# 지역 확인 (case 문 사용)
case $area_code in
    "02") area="서울" ;;
    "031") area="경기" ;;
    "032") area="인천" ;;
    "051") area="부산" ;;
    "033") area="강원" ;;
    "043") area="충북" ;;
    "041") area="충남" ;;
    "054") area="경북" ;;
    "055") area="경남" ;;
    "063") area="전북" ;;
    "061") area="전남" ;;
    *) area="" ;;
esac

# 이미 존재하는지 확인
if grep -q "$name $phone" "$phone_book"; then
    echo "이 번호는 존재하는 번호입니다."
    exit 2
fi

# 전화번호부에 저장
echo "$name $phone $area" >> "$phone_book"
echo "전화번호가 저장되었습니다: $name $phone $area"
