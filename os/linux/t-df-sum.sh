hn=`hostname`;val=`df -Pk | egrep -v "^(tmpfs|none|udev)" | awk '{total += $2; used += $3} END {print int(total/1024/1024) " " int(used/1024/1024)}'`;echo $hn $val
