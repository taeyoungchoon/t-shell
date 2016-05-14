wmic LogicalDisk Where DriveType="3" Get DeviceID,FreeSpace
REM
REM
REM http://superuser.com/questions/896764/windows-command-line-get-disk-space-in-gb
REM
REM psinfo /d | findstr Volume
REM psinfo /d | findstr NTFS
REM
REM Get-PSDrive
REM
REM diskpart
REM
REM fsutils
REM
