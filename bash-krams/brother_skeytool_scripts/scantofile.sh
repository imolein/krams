#! /bin/sh
set +o noclobber
#
#   $1 = scanner device
#   $2 = friendly name
#
device=$1
. /opt/brother/scanner/brscan-skey/script/scantox.sh

sleep  1

checkscanpath
scantox
convert2 file
finish
openscanwith file
