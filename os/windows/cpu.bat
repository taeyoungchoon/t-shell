wmic cpu get loadpercentage
REM
REM typeperf "\Processor(_Total)\% Processor Time"
REM
REM typeperf "\Process(*)\% Processor Time" -sc 1
REM List all processes, take 5 samples at 10 second intervals:
REM typeperf "\Process(*)\% Processor Time" -si 10 -sc 5
REM If you want a specific process, Rtvscan for example:
REM typeperf "\Process(Rtvscan)\% Processor Time" -si 10 -sc 5
REM
REM https://teckadmin.wordpress.com/2014/05/23/cpu-checks-in-windows-commandline/
REM remote
