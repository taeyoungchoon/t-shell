#!/usr/bin/env bash

yum -y -q install emacs-nox git psmisc tree bash-completion bridge-utils libvirt-client libvirt wget virt-install qemu-kvm

grep "PasswordAuthentication no" /etc/ssh/sshd_config >/dev/null 2>/dev/null
if test $? -eq 0; then
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    systemctl restart sshd
fi

if test ! -d /root/t-shell; then
    cd /root; git clone https://github.com/taeyoungchoon/t-shell.git
fi
