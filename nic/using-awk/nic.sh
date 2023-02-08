[[ $# -eq 0 ]] && echo Configuration file required && exit

awk -f nic.awk $1
