#!/bin/bash
while read sub; do 
   domain="$sub.sbtuk.net"; 
   if host $domain &> /dev/null; then
	   echo $domain
   fi
	
done < subdomains.txt 
