[[ ! -e $1 ]] && exit
awk -f net.awk $1
