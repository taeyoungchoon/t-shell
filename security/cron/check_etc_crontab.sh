stat -c %A /etc/crontab

# if other can read
if [[ $(stat -c %A /etc/crontab | cut -b 8) == 'r' ]]; then 
    echo bad;
    chmod o-r /etc/crontab
else echo good; fi
