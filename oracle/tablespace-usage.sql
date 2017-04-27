set feedback on
clear columns;

column timecol new_value today
column spool_extension new_value suffix
select to_char(sysdate,'YYYYMMDD') timecol,
'.txt' spool_extension from sys.dual;

column output new_value inst_name
select value || '_' output
from v$parameter where name = 'instance_name';

set linesize 160
set pages 150
spool Tablespace_&&today&&suffix append

select instance_name from v$instance;

SET PAGESIZE 100 
SET LINESIZE 100
COLUMN pct_free FORMAT 999.99 HEADING "% Free" 
COLUMN pct_used FORMAT 999.99 HEADING "% Used"
COLUMN name FORMAT A20 HEADING "Tablespace Name" 
COLUMN mbytes FORMAT 99,999,999 HEADING "Total MBytes" 
COLUMN used FORMAT 99,999,999 HEADING "Used Mbytes" 
COLUMN free FORMAT 99,999,999 HEADING "Free Mbytes" 

BREAK ON REPORT
COMPUTE SUM LABEL TOTAL OF mbytes free used ON REPORT 


SELECT
df.tablespace_name name, ts.extent_management ext_mgt,
df.totalspace mbytes,
(df.totalspace - NVL(fs.freespace,0)) used,
NVL(fs.freespace,0) free,
100 * (NVL(fs.freespace,0) / df.totalspace) pct_free,
100 * ((df.totalspace - NVL(fs.freespace,0)) / df.totalspace) pct_used
FROM
(SELECT
tablespace_name,
ROUND(SUM(bytes) / 1048576) TotalSpace
FROM
dba_data_files
GROUP BY
tablespace_name
) df,
(SELECT
tablespace_name,
ROUND(SUM(bytes) / 1048576) FreeSpace
FROM
dba_free_space
GROUP BY
tablespace_name
) fs, dba_tablespaces ts
WHERE df.tablespace_name = fs.tablespace_name(+)
AND df.tablespace_name = ts.tablespace_name;

spool off

exit;
