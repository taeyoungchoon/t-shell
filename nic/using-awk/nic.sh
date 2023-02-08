[[ ! -e $1 ]] && echo Configuration file required && exit

awk -f bond.awk $1
