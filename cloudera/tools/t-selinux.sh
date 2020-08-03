function disable() {
    echo "disable called"
    sudo sed -i "s/SELINUX=permissive/SELINUX=disabled/" /etc/selinux/config
}

sestatus  | grep 'SELinux status' | grep enabled
returncode=$?

if [[ $returncode == 0 ]]; then
    echo 'enabled'
    echo 'call disable'
    disable
    echo 'reboot required to be sure'
fi

