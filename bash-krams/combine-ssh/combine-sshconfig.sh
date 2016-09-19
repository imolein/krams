#!/bin/bash -e

user=
group=
sshpath=/home/$user/.ssh
sshconf=$sshpath/config
sshconftmp=$(mktemp)
logfile=$sshpath/combine-sshconfig.log
confA=
confB=
date=$(date +"%b %d %T")

cat $confA $confB >> $sshconftmp

if [[ "x$(md5sum $sshconf | awk '{print $1}')" == "x$(md5sum $sshconftmp | awk '{print $1}')" ]]; then
    echo "$date - ssh configuration identical" >> $logfile
    rm $sshconftmp
else
    echo "$date - ssh configuration out of date - well be replaced" >> $logfile
    rm $sshconf
    mv $sshconftmp $sshconf
    chown $user:$group $sshconf
fi

exit 0
