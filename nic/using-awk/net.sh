[[ ! -e $1 ]] && echo Configuration file required && exit

awk -f net.awk $1
