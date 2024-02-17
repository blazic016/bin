#!/bin/bash


# RT-RK
# Od simbolickih linkova napravljeni su fajlovi koji u sebi sadrze putanju linka i to nam predstavlja problem.
# Ovde se radi o skripti koja filtrira fajlove u kojim postoji mogucnost da sadrzi putanju
# Nakon primene ovog filtera potrebno je proveriti (cat <file>) svaki fajl (ako se radi o linku)koji je dobijen ovom skriptom 
# i od tog fajla rucno napraviti simbolicki link.


# Primer pravljenja simbolickog linka
#   File:           Sadrzi       
#   ./var/pcmcia    ../tmp/pcmcia
#   Resenje
#   cd var 
#   rm pcmcia
#   ln -s ../tmp/pcmcia pcmcia



#REKRUZIVNI ISPIS FAJLOA SA PUTANJOM
#ls -R . | awk '
#/:$/&&f{s=$0;f=0}
#/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
#NF&&f{ print s"/"$0 }'


for f in $(ls -R . | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }')
do
    #if [[ -d $f ]]
    #then
        #echo "D $f"
    if [[ -f $f ]]
    then
        #echo "F $f"
        filename=$(ls -l $f| sort -k 5 -n | awk '{print $9}')
        size=$(ls -l $f| sort -k 5 -n | awk '{print $5}')
        num_lines=$(wc -l $f | awk '{ print $1 }')
        #echo $filename $size $num_lines
        if ((num_lines < 2));
        then
            echo $filename " | " $size "byte | " $num_lines "line"
        fi

    fi

done
