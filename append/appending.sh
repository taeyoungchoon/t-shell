echo 'append line 1
append line 2' > data

sed '/body/r data' before > after

rm data
