tail -100 /var/log/messages | egrep -v "save-entropy|hourly|newsyslog|cron|fwconnoxid_get_connoxid_data"
