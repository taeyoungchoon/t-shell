# win
hostname
netstat -rn | findstr Default
netsh int ipv4 show route | findstr x.x.x.x
netstat -rn | findstr x
ipconfig /all | findstr /c:Desc /c:Phys /c:IPv4

# windows try ####
https://superuser.com/questions/524822/awk-equivalent-functionality-on-windows

chcp 437
REM hostname > hostname_v
REM set /p hn=< hostname_v
REM echo %hn%

for /f "tokens=1" %a in ('hostname') do set hn=%a
echo %hn%

for /f "tokens=3" %a in ('netstat -rn ^| findstr Default') do set nic=%a
echo %nic%

for /f "tokens=5" %a in ('netsh int ipv4 show route ^| findstr %nic%') do set idx=%a
echo %idx%

netstat -rn | findstr /c:%idx%...

ipconfig /all | findstr /c:IPv4 | findstr /c:Prefer
