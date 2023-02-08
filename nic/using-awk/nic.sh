[[ ! -e $1 ]] && echo Configuration file required && exit

awk -f nic.awk $1
