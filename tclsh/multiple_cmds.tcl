#https://howdoesinternetwork.com/2018/create-file-cisco-ios
#https://fastreroute.com/cisco-tcl-multiple-commands-at-once/
#https://community.cisco.com/t5/networking-knowledge-base/tclsh-implementation-of-host-nm/ta-p/3123994

tclsh
#puts [open "flash:script.tcl" w+] {
puts [open "unix:script.tcl" w+] {
puts "#show version | include uptime"
show version | include uptime
puts "#show clock"
show clock
}
tclquit

tclsh unix:script.tcl
tclsh
source unix:script.tcl
quit

#---
#https://blog.ipspace.net/kb/Tclsh/10-commands.html
#https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/ios_tcl/configuration/xe-16/ios-tcl-xe-16-book/Cisco_IOS_XE_Scripting_with_Tcl.html

tclsh
set cmds { 
"show version | include uptime" 
"show clock" 
}
foreach cmd $cmds { 
puts "#$cmd"
[$cmd] 
}
tclquit

#---

if {[catch {set out [exec {show clock}]} e]} { 
  puts $e
} else { 
  puts $out 
}

#---
#https://wiki.tcl-lang.org/page/catch

if {[catch {exec show int status} result] == 0} { puts $result }

#---
