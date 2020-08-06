rpm -qa | grep -i maria | sed 's/^/rpm -ql /' | sh | sort | cut -d '/' -f 1,2,3| sort | uniq
