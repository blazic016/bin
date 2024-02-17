#!/bin/bash

## 
## Check which line is missing in the two files.
## 
## Usage:
## ./checklines.sh FILE_1 FILE_2
##


FILE_1=$1
FILE_2=$2
MATCH="###### MATCH ######"
NOT_MATCH="######################################\n###### Exists in $FILE_1 but not in $FILE_2  ######\n######################################"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color



while read line; 
do
    if grep $line $FILE_2 > /dev/null 2>&1; then
        #echo "MATCH: $line"
        MATCH="$MATCH\n$line"
    else
         #echo "NOT MATCH: $line"
         NOT_MATCH="$NOT_MATCH\n$line"
    fi
done < $FILE_1

echo -e ${GREEN}$MATCH${NC}
echo -e ${RED}$NOT_MATCH${NC}

exit





## ne sljaka najbolje
for i in $(cat $FILE_1); do
    if grep $i $FILE_2 > /dev/null 2>&1; then
        #echo "MATCH: $i"
        MATCH="$MATCH\n$i"
    else
         #echo "NOT MATCH: $i"
         NOT_MATCH="$NOT_MATCH\n$i"
    fi
done
wait

echo -e ${GREEN}$MATCH${NC}
echo -e ${RED}$NOT_MATCH${NC}
