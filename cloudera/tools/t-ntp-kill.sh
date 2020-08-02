# install

function remove() {
    echo 'removing'
    sudo yum remove ntp -y
}

rpm -q ntp 1>/dev/null 2>/dev/null
returncode=$?

if [[ $returncode == 0 ]]; then
    echo 'installed'
    echo 'call remove'
    remove
fi
