#!/usr/bin/bash

JBOSS_HOME=$1
LogFile=$2

today=`date +%Y%m%d`

#echo "Checking if JBoss DC is running..."
#echo '-----------------------------------------------'
#ps auxwww | grep java | grep dc.properties | grep -v grep
#if [[ $? -eq 0 ]];then
#	echo 'JBoss DC is already running... Run stop script...'
#	exit 1
#else
#  echo 'No JBoss DC was running'
#fi
#echo

echo 'Starting JBoss DC in a minute...'
nohup $1/bin/domain.sh --host-config=host-master.xml | rotatelogs -l $LogFile.%Y%m%d 86400 2>&1 &
echo 'DC server is started succssfully, Check logs.....'
