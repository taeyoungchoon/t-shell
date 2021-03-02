# ls -l /etc/cron.allow /etc/cron.deny
for f in /etc/cron.allow /etc/cron.deny; do
    if test -e $f; then
	echo name : $f;
	echo exist : yes;
	echo size : $(stat -c %s $f);
    fi
done
