# config to use banner, banner none
# exist banner
echo '* check config file'
sshd -T | grep -q 'banner none'
if (( $? == 0 )); then echo '- bad'; else 
    echo '- good'; 
    #sshd -T | grep 'banner'
fi
