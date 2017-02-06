#!/bin/bash
#===============================================================================
#
#          FILE:  build.sh
# 
#         USAGE:  ./build.sh 
# 
#   DESCRIPTION:  build images
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hamady Mohamed (), mhamady@xebia.fr
#       COMPANY:  Xebia
#       VERSION:  1.0
#       CREATED:  02.02.2017 11:30:40 CET
#      REVISION:  ---
#===============================================================================

set -ex

basefolder=$(readlink -f $0 | xargs dirname)

dependencies=(
	"dockerfiles/centos"
	"dockerfiles/collectd"
	"dockerfiles/graphite/carbon-base"
	)

for dependency in "${dependencies[@]}" ; do
	cd $basefolder/$dependency && chmod +x ./build.sh && ./build.sh
	cd $basefolder
done

docker-compose build

mkdir /opt/docker/storage/whisper
