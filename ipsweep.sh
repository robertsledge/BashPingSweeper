#!/bin/bash

# Script checks to see if you've added a valid IP address. If not, the following error prints to screen:

if [ "$1" == "" ]
then
echo "You forgot an IP address!"
echo "Syntax: ./ipsweep.sh 192.168.5"

# Once the IP address is validated, the next section says that for every ip in the range of 1-254, we are going to hit a for loop that will
# ping it once (-c 1) and then find the string "64 bytes", retun them using a delimiter (-d) of 'space' and cutting the 4th delimiter (-f 4), 
# which would be the 4th space, helping to extract the IP address.
#
# tr -d ":" drops the colon from the end of the IP. 
# for loop keeps going until it hits IP limit, using $1 argument for the IP input, and using .$ip to go in sequence IP to IP.
#
# The ampersand allows mulltiple instances of the ping command to happen at once. 
#
# Another neat thing is to use the script and just push the output to a file. Ex:ipsweep.sh 192.168.5 > ips.txt
#
# ** Original script by Georgia Weidman **

else
for ip in `seq 1 254`; do 
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi
