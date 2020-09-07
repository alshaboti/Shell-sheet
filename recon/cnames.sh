#!/bin/bash
domain=$1
while read sub; do 
   cname=$(host -t CNAME $sub.$domain|grep "an alias" |awk '{print $NF}')
   if [ -z "$cname" ]; then
	   continue
   fi
   if ! host $cname &> /dev/null; then
	   echo "did not resolve $cname $sub.$domain"
   fi
	
done 
