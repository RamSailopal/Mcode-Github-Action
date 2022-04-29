#!/bin/bash
/opt/yottadb/current/ydb <<< "H" > /dev/null
cd /usr/local
git clone "https://$2:$3@${1##https://}" 
path=${1##*//*/*/}
path1=${path%%.git}
cd path1
find . -name "*.m" -exec cp '{}' /data/r1.32_x86_64/r \;
echo -e "\nRunning compliations\n"
ostat=0
while read rout
do
   rout1=${rout##/data/r1.32_x86_64/r/}
   resp="$(/opt/yottadb/current/ydb <<< "ZL \"$rout1\"" 2>&1 | awk 'BEGIN { ercode=0 } /%YDB/ { print;excode=1 } END { exit excode }')"
   if [[ "$?" == "0" ]]
   then
       status="SUCCESS"
       resp="No errors"
   else
       status="FAIL"
       ostat=1
   fi
   echo -e "\n\n$rout1\n\n$resp\n\n$status"
done <<< "$(find /data/r1.32_x86_64/r -name "*.m")"
exit $ostat


