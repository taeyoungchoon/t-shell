# install

function install() {
    echo 'install called'
    sudo yum install ntp -y
}

rpm -q ntp 1>/dev/null 2>/dev/null
returncode=$?

if [[ $returncode != 0 ]]; then
    echo 'not installed'
    echo 'call install'
    install
fi

function active() {
    echo 'active called'
    sudo systemctl start ntpd
}

sudo systemctl is-active ntpd 1>/dev/null 2>/dev/null
returncode=$?

if [[ $returncode != 0 ]]; then
    echo 'not active'
    echo 'call active'
    active
fi

function enable() {
    echo 'enable called'
    sudo systemctl enable ntpd
}

sudo systemctl is-enabled ntpd 1>/dev/null 2>/dev/null
returncode=$?

if [[ $returncode != 0 ]]; then
    echo 'not enabled'
    echo 'call enable'
    enable
fi


