#!/bin/bash
cookiesfile="/tmp/hotcrp.cookies"
getfn="json"

#H_URL="http://localhost:9160"
#H_USER="test"
#H_PWD="test"

[ -e $cookiesfile ] && rm $cookiesfile

# login
curl "$H_URL?post=.empty" \
  -b $cookiesfile -c $cookiesfile \
  -F "email=$H_USER" -F "password=$H_PWD" -F "signin=Sign in" > /dev/null 2>&1

curl "$H_URL?postlogin=1" \
  -b $cookiesfile -c $cookiesfile > /dev/null 2>&1

# parse the post code and format the search URL
post=$(curl -sS "$H_URL" -b $cookiesfile -c $cookiesfile | sed -n 's/.*amp;post=\([A-Za-z0-9][A-Za-z0-9]*\)".*/\1/p')
post=$(echo $post | awk '{print $1}')
req="$H_URL/search?q=status%3DAnnounced&t=s&post=$post&action=get-$getfn"
pap=$(curl -sS $req -b $cookiesfile -c $cookiesfile | sed -n 's/.*id="p\([0-9][0-9]*\)".*/\1/p')

# fetch data
curl -sS \
  -F "defaultact=" \
  -F "forceShow=" \
  -F "getfn=$getfn" \
  -F "fn=get" \
  -F "tagfn=a" \
  -F "tag=" \
  -F "tagcr_method=schulze" \
  -F "tagcr_sorce=" \
  -F "assignfn=auto" \
  -F "markpc=none" \
  -F "decision=" \
  -F "recipes=au" \
  -F "pap=$pap" \
  "$req" \
  -b $cookiesfile -c $cookiesfile \
  --header "Cache-Control: max-age=0,must-revalidate,private" \
  --header "Connection: keep-alive" \
  --header "Content-Length: 1417" \
  --header "Origin: $H_URL" \
  --header "Referer: $req" \
  --header "Sec-Fetch-Dest: document" \
  --header "Sec-Fetch-Mode: navigate" \
  --header "Sec-Fetch-Site: same-origin" \
  --header "Sec-Fetch-User: ?1" \
  --header "Upgrade-Insecure-Requests: 1" > _data/schedule.json

rm $cookiesfile
