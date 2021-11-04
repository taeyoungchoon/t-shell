#!/usr/bin/env bash

# grep "PasswordAuthentication no" /etc/ssh/sshd_config >/dev/null 2>/dev/null
# if test $? -eq 0; then
#     sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#     systemctl restart sshd
# fi

if test ! -d /root/t-shell; then
    cd /root; git clone https://github.com/taeyoungchoon/t-shell.git
fi
