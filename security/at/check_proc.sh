if [[ $(systemctl is-active atd) == 'active' ]]; then echo t; else echo nil; fi
