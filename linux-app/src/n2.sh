#!/bin/bash

[ -z "$1" ] && echo "Usage: `basename $0` [dhb]<number>" && exit 0;

case "$1" in
	[dD]*) 
		NUM=$(echo $1 | cut -b 2-)
		printf "\tDec\tHex\tBin\n"
		printf "\t%d\t0x%02X\t%s\n" $NUM $NUM $(bc <<< "obase=2;$NUM")
		;;
	[hH]*) 
		NUM=$(echo $1 | cut -b 2-)
		NUM=$(echo $NUM | tr [:lower:] [:upper:])
		printf "\tHex\t\tDec\t\tBin\n" 
		printf "\t0x%s\t\t%s\t\t%s\n" $NUM $(bc <<< "ibase=16;obase=A;$NUM") \
			$(bc <<< "ibase=16;obase=2;$NUM")	
		;;
	0[xX]*)
		NUM=$(echo $1 | cut -b 3-)
		NUM=$(echo $NUM | tr [:lower:] [:upper:])
		printf "\tHex\t\tDec\t\tBin\n" 
		printf "\t0x%s\t\t%s\t\t%s\n" $NUM $(bc <<< "ibase=16;obase=A;$NUM") \
			$(bc <<< "ibase=16;obase=2;$NUM")	
		;;	
	[bB]*) 
		NUM=$(echo $1 | cut -b 2-)
		printf "\tBin\t\tHex\t\tDec\n" 
		printf "\t%s\t\t0x%s\t\t%s\n" $NUM $(bc <<< "ibase=2;obase=10000;$NUM") \
			$(bc <<< "ibase=2;obase=1010;$NUM")
		;;
	    *) 
		printf "Dec\tHex\tBin\n"
		printf "%d\t0x%08X\t%08d\n" $1 $1 $(bc <<< "obase=2;$1")
		;;
esac
