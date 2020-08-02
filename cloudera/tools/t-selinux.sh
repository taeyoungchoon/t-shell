if [[ "sestatus  | grep 'SELinux status' | grep disabled" ]]; then 
    echo 'disabled'; 
else
    echo 'enabled';
fi

