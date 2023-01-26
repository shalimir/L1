#!/bin/bash

param=$1
#1.From which ip were the most requests? 
top5ip () {
    echo "From which ip were the most requests?"
    local result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort 
-nr | awk '{print "From IP " $2 "\t were " $1 " requests" }' | head -n 
5)
    echo -e "$result\n"
}
#2.What is the most requested page?
top5pages () {
    echo "What is the most requested page?"
    result=$(cat $param | cut -d\" -f2 | awk '{print $2}' | egrep -iv 
"ico$|woff|ttf" | sort | uniq -c | sort -nr | head -n 5 | sed -e 's/^[ 
\t]*//')
    echo -e "$result\n"
}
#3.How many requests were there from each ip?
requestIpCount () {
    echo "3. How many requests were there from each ip?"
    result=$(cat $param | awk '{print $1}' | sort | uniq -c | sort -nr | 
awk '{ip = $2; r = $1; printf "From IP %-15s - %d request%s\n", ip, r, r 
== 1 ? "" : "s"}')
    echo -e "$result\n"
}
#4.What non-existent pages were clients referred to?
nonExistPages () {
    echo "4. What non-existent pages were clients reffered to?"
    result=$(cat $param | grep " 404 " | cut -d\" -f2 | awk '{print $2}' 
| sort | uniq)
    echo -e "$result\n"
}
#5.What time did site get the most requests?
mostTimeRequest () {
    echo "5. What time did site get the most requests?"
    result=$(cat $param | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print 
$2":00"}' | sort -n | uniq -c | sort -rn)
    echo -e "$result\n"
}
#6.What search bots have accessed the site? (UA + IP)?
showSearchBot () {
    echo "6. What search bots have accessed the site (UA + IP)?"
    result=$(cat $param | cut -d" " -f12 | grep -i bot | cut -d/ -f1 | 
sort | uniq | cut -c 2-)
    echo -e "$result\n"
}


if [[ $# -ne 1 ]]
then
    echo -e "For running script it needs one argument - \nlog file name 
with full path"
else
    top5ip
    top5pages
    requestIpCount
    nonExistPages
    mostTimeRequest
    showSearchBot
fi
