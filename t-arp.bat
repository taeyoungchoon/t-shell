chcp 437

:begin

rem cls
echo %time%
arp -a | findstr dynamic
rem timeout /t 10 /nobreak > nul
rem ping -w 3000 -n 1 1.0.0.0 > nul
ping -w 1000 -n 3 127.0.0.1 > nul

goto begin


