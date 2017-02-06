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
#       CREATED:  06.12.2016 00:49:35 CET
#      REVISION:  ---
#===============================================================================

docker build -t local/carbon-cache .
