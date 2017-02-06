#!/bin/bash
#===============================================================================
#
#          FILE:  fix-storage-dir.sh
# 
#         USAGE:  ./fix-storage-dir.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hamady Mohamed (), mhamady@xebia.fr
#       COMPANY:  Xebia
#       VERSION:  1.0
#       CREATED:  08.12.2016 23:47:59 CET
#      REVISION:  ---
#===============================================================================
instance=$1
sed -i -e "s/\(LOCAL_DATA_DIR\).*$/\1 = $(printf "/opt/graphite/storage/whisper/$instance" | sed -e 's/\//\\\//g')/g" /opt/graphite/conf/carbon.conf
