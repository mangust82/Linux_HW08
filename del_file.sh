#!/bin/bash

direct=$1
if [ -d $direct ]
  then 
	rm -rf $direct/*.bak $direct/*.tmp $direct/*.backup
	echo 'All delete'
  else
	echo 'such directory is not exist'
fi
