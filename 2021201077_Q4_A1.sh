#!/bin/bash
func1(){
	A=(Z I II III IV V VI VII VIII IX)
	B=(Z X XX XXX XL L LX LXX LXXX XC)
	C=(Z C CC CCC CD D DC DCC DCCC CM)
	D=(Z M MM MMM MMM)

	num=$1

  		if [ $num -ge 1000 ]
  		then
  		    th=`expr $num / 1000`
  		    echo -n "${D[$th]}"
  		fi
  	
  		num=`expr $num % 1000`
  	
  		if [ $num -ge 100 ]
  		then
  		    h=`expr $num / 100`
  		    echo -n "${C[$h]}"
  		fi
	
  		num=`expr $num % 100`
	
  		if [ $num -ge 10 ]
  		then
  			t=`expr $num / 10`
  			echo -n "${B[$t]}"
  		fi

  		num=`expr $num % 10`
  		if [ $num -ge 1 ]
  		then
  			echo -n "${A[$num]}"
  		fi
  		echo
}
func2(){
	set -eu -o pipefail

	roman_numerals=$1
	num2=$2


	[[ "${roman_numerals//[IVXLCDM]/}" == "" ]] || \
    	{ echo Roman numerals ${roman_numerals} contains invalid characters ; \
    	exit 1 ;}

	number1=$(
    	echo ${roman_numerals} |
    	sed 's/CM/DCD/g' |
    	sed 's/M/DD/g' |
    	sed 's/CD/CCCC/g' |
    	sed 's/D/CCCCC/g' |
    	sed 's/XC/LXL/g' |
    	sed 's/C/LL/g' |
    	sed 's/XL/XXXX/g' |
    	sed 's/L/XXXXX/g' |
    	sed 's/IX/VIV/g' |
    	sed 's/X/VV/g' |
    	sed 's/IV/IIII/g' |
    	sed 's/V/IIIII/g' |
    	tr -d '\n' |
    	wc -m
	)
	
	[[ "${num2//[IVXLCDM]/}" == "" ]] || \
    	{ echo Roman numerals ${num2} contains invalid characters ; \
    	exit 1 ;}

	number2=$(
    	echo ${num2} |
    	sed 's/CM/DCD/g' |
    	sed 's/M/DD/g' |
    	sed 's/CD/CCCC/g' |
    	sed 's/D/CCCCC/g' |
    	sed 's/XC/LXL/g' |
    	sed 's/C/LL/g' |
    	sed 's/XL/XXXX/g' |
    	sed 's/L/XXXXX/g' |
    	sed 's/IX/VIV/g' |
    	sed 's/X/VV/g' |
    	sed 's/IV/IIII/g' |
    	sed 's/V/IIIII/g' |
    	tr -d '\n' |
    	wc -m
	)
	sum=`expr $number1 + $number2`
	echo $sum
	
}

if [ $#  -eq 1 ] 
then
	func1 $1
elif [ $# -eq 2 ]
then 
	if [[ $1 =~ ^[[:digit:]]+$ ]]
	then
	sum=`expr $1 + $2`
	func1 $sum
	else
		func2 $1 $2
	fi
fi

