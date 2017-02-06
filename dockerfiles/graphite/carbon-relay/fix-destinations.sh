#!/bin/bash
set -x
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
destinations=$@
sed -i -e "s/\(destinations\).*$/\1 = $(printf "$destinations" | sed -e 's/\//\\\//g')/g" /opt/graphite/conf/relay-rules.conf
sed -i -e "s/\(DESTINATIONS\).*$/\1 = $(printf "$destinations" | sed -e 's/\//\\\//g')/g" /opt/graphite/conf/carbon.conf
