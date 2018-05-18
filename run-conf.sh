#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -z $1 ]
then
 CONFIG_FILE=conf.$1 
 echo using conf: $CONFIG_FILE
 cd $DIR/config
 if [ -f $CONFIG_FILE ]
 then 
   rm tinyproxy.conf
   ln -s $CONFIG_FILE tinyproxy.conf
 else
   echo config dont exist, stoping here
   echo configs are:
   ls conf.*
   exit 1
 fi
else
 echo using actual conf: tinyproxy.conf
fi

bash $DIR/restart.sh

