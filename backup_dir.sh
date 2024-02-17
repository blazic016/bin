#!/bin/bash

## USAGE 
## backup_dir.sh STORE_DIR BACKUP_FILE_DIR
## ./backup_dir.sh /HDD/TEST-BACKUP /home/mblazic/Mega/bin/MISRA_TOOL

## EXECUTE SHELL IN JENKINS
#  #!/bin/bash
#  ssh root@remote_host "/root/backup_dir.sh \"$BACKUP_DIR_PARAM\""

#BACKUP_DIR="/home/remote_user/backup"

STORE_DIR=$1
BACKUP_FILE_DIR=$2
FNAME_DIR=$(basename $2)

echo "STORE_DIR=$STORE_DIR"
echo "BACKUP_FILE_DIR=$BACKUP_FILE_DIR"
echo "FNAME_DIR=$FNAME_DIR"

DELIM=$(echo $BACKUP_FILE_DIR | tr "/" "\n")

dir_num=0
for i in $DELIM
do
    let "dir_num++"
done
echo "Num of dir: $dir_num"

# Examine if the last element dir or file
if [ -d $BACKUP_FILE_DIR ]; then
    echo "It is a dir: $BACKUP_FILE_DIR "
else
    if [ -f $BACKUP_FILE_DIR ]; then
        echo "It is a file: $FNAME_DIR"
        # cut last element
        BACKUP_FILE_DIR=$(echo $BACKUP_FILE_DIR | rev | cut -d'/' -f2-$((dir_num+1)) | rev)
        echo "F_PATH: $BACKUP_FILE_DIR"
    fi
fi

if [[ $# -eq 0 ]] ; then
    echo "ERR - Lack number of args."
    exit 0
elif [[ $# -eq 2 ]] ; then

    tar -czvf $STORE_DIR/$FNAME_DIR-$(date '+%Y-%m-%d--%H-%M-%S').tar.gz $FNAME_DIR 
      
    pushd $STORE_DIR
    ls -t | grep "$FNAME_DIR" | grep "tar.gz" | sed '1,2d' > /tmp/temporarylsbackp

    while read filename; 
    do
        echo ">> rm $filename"
        rm -v $filename
    done < /tmp/temporarylsbackp
    
    popd
else 
    echo "ERR - Too much number of args."
fi

# /root/backup_dir.sh /root/BACKUP-jobs /root/testdir-for-backup
