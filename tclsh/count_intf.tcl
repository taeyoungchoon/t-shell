set out [exec "sh int status | inc Et"]

sh int status | count Et0
regexp -all -line "Et0/.*connected" $out

sh int status | count Et1
regexp -all -line "Et1/.*connected" $out

sh int status | count Et9
regexp -all -line "Et9/.*connected" $out
