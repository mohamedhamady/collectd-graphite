#!/bin/bash
set -e
#===============================================================================
#
#          FILE:  build.sh
# 
#         USAGE:  ./build.sh 
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
#       CREATED:  07.12.2016 23:54:08 CET
#      REVISION:  ---
#===============================================================================
if [ ! -f collectd.service ]; then
  wget https://raw.githubusercontent.com/martin-magakian/collectd-script/master/collectd.service
fi

docker build --rm -t local/collectd .
