echo '* generate banner file'
if test -e /etc/ssh/banner; then 
    echo '- banner file exist'
else
    echo 'legal notice' > /etc/ssh/banner
    echo '- good'
fi
