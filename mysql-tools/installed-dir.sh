rpm -qa | grep -i maria | sed 's/^/rpm -ql /' | sh | sed 's/^/dirname /' | sh  | uniq -c
