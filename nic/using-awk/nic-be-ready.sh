[[ ! -e $1 ]] && exit
awk -f bond.awk $1
