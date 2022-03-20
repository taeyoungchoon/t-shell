NR==1{tmp = $2; gsub(",","",$2); print $1" "tmp" 0"; old = $2} NR>1{tmp = $2; gsub(",","",$2); printf("%s %s %'"'"'d\n", $1, tmp, $2 - old); old = $2}
