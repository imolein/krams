#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#   $3 = email address

#
#       100,200,300,400,600
#

device=$1
. /opt/brother/scanner/brscan-skey/script/scantox.sh

sleep 1

checkscanpath
scantox
convert2 file
finish
openscanwith mail
