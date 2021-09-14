#!/bin/bash
value=`cat $1`
a=( $value )
for i in ${a[*]}
do
	echo $i  | grep -i "ing" >> $2
done
