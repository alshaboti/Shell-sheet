#!/bin/bash
domain=$1
while read sub; do 
   dn="$sub.$domain"; 
   if host $dn &> /dev/null; then
	   echo $dn
   fi
	
done 
