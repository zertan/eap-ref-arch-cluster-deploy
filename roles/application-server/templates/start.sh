#!/usr/bin/bash

JBOSS_HOME=$1
LogFile=$2

today=`date +%Y%m%d`

#echo "Checking if JBoss Host1 is running..."
#echo '-----------------------------------------------'
#ps auxwww | grep java | grep host1.properties | grep -v grep
#if [[ $? -eq 0 ]];then
#	echo 'JBoss Host1 is already running... Run stop script...'
#	exit 1
#else
#  echo 'No JBoss Host1 was running'
#fi
#echo

echo 'Starting JBoss Host2 in a minute...'
(nohup $1/bin/domain.sh --host-config=host-slave.xml | rotatelogs -l $LogFile.%Y%m%d 86400 2>&1 &) 
echo 'Host1 server is started succssfully, Check logs.....'
