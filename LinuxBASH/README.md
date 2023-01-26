### Linux administration with bash. Home task
# A. Create a script that uses the following keys:
1. When starting without parameters, it will display a list of possible keys and their description. 
2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet 
3. The --target key displays a list of open system TCP ports.
The code that performs the functionality of each of the subtasks must be placed in a separate function
```
#!/bin/bash

arpGrep () {
  echo "$(arp $1 | tail -n 1 | awk '{print $1}')"
}

showSubnetIPnmap () {
  if [[ `/usr/bin/which nmap` ]]
  then 
    subnetip="$(sudo nmap -sP -n $(ip -o address | awk '/scope global/ {print $4}' | \
     head -n 1) | awk '/Nmap scan/ {print $5}')"
    for ip in $subnetip
    do
      echo "$ip [$(arpGrep $ip)]"
    done
  else
    echo "To run this script you have to install \"nmap\""
  fi
}

showSubnetIP () {
  # The method that doesn't use nmap. 
  # You need to obtain full range of ip addresses to scan in for loop.

  ip=`ip -o address | awk '/scope global/ {print $4}' | head -1 | cut -d"/" -f1`
  cidr=`ip -o address | awk '/scope global/ {print $4}' | head -1 | cut -d"/" -f2`
  hosts=$((2**(32-$cidr)-2))
  netmask=$(ifconfig | grep $ip | awk '{print $4}')
  #M=$(( 0xffffffff ^ ((1 << (32-cidr)) -1) ))
  #netmask="$(( (M>>24) & 0xff )).$(( (M>>16) & 0xff )).$(( (M>>8) & 0xff )).$(( M & 0xff ))"
  
  echo "ip = $ip"
  echo "cidr = $cidr"
  echo "hosts number = $hosts"
  echo "netmask = $netmask"

}

showPorts () {
  if [[ `/usr/bin/which netstat` ]]
  then
    echo "$(sudo netstat -tlpn | grep LISTEN | awk '{print $1,$4}')"
  else
    echo -e "To run this script you have to install \"netstat\"\n\
In order to do it run on Ubuntu \"sudo apt install net-tools\"\n\
or \"sudo yum install net-tools\" on Centos"
  fi
}


main () {

  MESSAGE="You have to use one parameter:\n
--all - to display IP addresses and symbolic names of all hosts in the current subnet\n
--target  - to display a list of open system TCP ports"

  if [[ $# -ne 1 ]]
  then
    echo -e $MESSAGE
  elif [[ $1 == "--all" ]]
  then
    showSubnetIPnmap
  elif [[ $1 == "--target" ]]
  then
    showPorts
  else
    echo -e $MESSAGE
  fi

}


main $1
```
# B. Using Apache log example create a script to answer the following questions:
1. From which ip were the most requests? 
2. What is the most requested page? 
3. How many requests were there from each ip? 
4. What non-existent pages were clients referred to? 
5. What time did site get the most requests? 
6. What search bots have accessed the site? (UA + IP)
```
#!/bin/bash

param=$1

top5ip () {
    echo "1. Top 5 IP from which were the most requests"
    local result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{print "From IP " $2 "\t were " $1 " requests" }' | head -n 5)
    echo -e "$result\n"
}

top5pages () {
    echo "2. Top 5 the most requested pages"
    result=$(cat $param | cut -d\" -f2 | awk '{print $2}' | egrep -iv "ico$|woff|ttf" | sort | uniq -c | sort -nr | head -n 5 | sed -e 's/^[ \t]*//')
    echo -e "$result\n"
}

requestIpCount () {
    echo "3. How many requests were there from each ip?"
    result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{ip = $2; r = $1; printf "From IP %-15s - %d request%s\n", ip, r, r == 1 ? "" : "s"}')
    echo -e "$result\n"
}

nonExistPages () {
    echo "4. What non-existent pages were clients reffered to?"
    result=$(cat $param | grep " 404 " | cut -d\" -f2 | awk '{print $2}' | sort | uniq)
    echo -e "$result\n"
}

mostTimeRequest () {
    echo "5. What time did site get the most requests?"
    result=$(cat $param | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c | sort -rn)
    echo -e "$result\n"
}

showSearchBot () {
    echo "6. What search bots have accessed the site (UA + IP)?"
    result=$(cat $param | cut -d" " -f12 | grep -i bot | cut -d/ -f1 | sort | uniq | cut -c 2-)
    echo -e "$result\n"
}


if [[ $# -ne 1 ]]
then
    echo -e "For running script it needs one argument - \nlog file name with full path"
else
    top5ip
    top5pages
    requestIpCount
    nonExistPages
    mostTimeRequest
    showSearchBot
fi
```
# C. Create a data backup script that takes the following data as parameters:
1. Path to the syncing directory.
2. The path to the directory where the copies of the files will be stored.
In case of adding new or deleting old files, the script must add a corresponding entry to the log file 
indicating the time, type of operation and file name. [The command to run the script must be added to 
crontab with a run frequency of one minute

```
#!/bin/bash

# C. Create a data backup script that takes the following data as
#parameters:
#1. Path to the syncing directory.
#2. The path to the directory where the copies of the files will be
#stored.
#In case of adding new or deleting old files, the script must add a
#corresponding entry to the log file
#indicating the time, type of operation and file name. [The command to
#run the script must be added to
#crontab with a run frequency of one minute]

if [[ $# -eq 2 ]]
then
    src=$1
    dest=$2
    rsync -avz --progress --delete $src $dest
--log-file=/tmp/backup.log
    echo -e "\n"
    echo "Logs writes to /tmp/backup.log"
else
    echo "This script needs 2 arguments: source dir and destination
dir."
fi

#crontab: * * * * * /path/to/this-script

```