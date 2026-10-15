#!/bin/bash

cat Property_Tax_Roll.csv |
grep "MADISON SCHOOLS" |
cut -d ',' -f 7 |
{

sum=0
total=0

while read value
do
  sum=$((sum + value))
  total=$((total + 1))
done

echo "Sum: $sum"
echo "Average: $((sum / total))"
}
