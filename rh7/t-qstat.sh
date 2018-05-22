echo "ps -eo pid,cmd" > qstat
chmod +x qstat
cp qstat /usr/local/bin/
/usr/local/bin/qstat | tail -3
qstat | tail -3
