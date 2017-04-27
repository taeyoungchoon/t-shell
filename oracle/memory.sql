rem This script will show the current PGA, UGA memory size per session.

set pagesize 66
set pause on
set verify off
set feed off
clear screen

column sid heading 'sid' format 999
column username heading 'username' format a8
column pgm heading 'program' format a25
column terminal heading 'terminal' format a8
column pga heading 'PGA session memory' format a11
column uga heading 'UGA session memory' format a11
column pga_sum heading 'SUM PGA mem' format a12
column uga_sum heading 'SUM UGA mem' format a12
column pga_max heading 'Max PGA session memory' format a15
column uga_max heading 'Max UGA session memory' format a15
column pga_m_sum heading 'Sum Max PGA session memory' format a11
column uga_m_sum heading 'Sum Max UGA session memory' format a11

spool sess.txt

ttitle '**********< Program Global Area >**********'
ttitle '1. Current pga, uga session memory'

select a.sid, a.username, substr(a.program, 1, 25) as pgm, a.terminal,
max(decode(c.name, 'session pga memory', trunc(value/1000)||'K', 0)) pga,
max(decode(c.name, 'session uga memory', trunc(value/1000)||'K', 0)) uga
from v$session a, v$sesstat b, v$statname c
where a.sid = b.sid
and b.statistic# = c.statistic#
and c.name like 'session%'
group by a.sid, a.username, substr(a.program, 1, 25), a.terminal;

ttitle '2. Sum of current pga, uga session memory'

select 'Current PGA, UGA session memory SUM:' as sum,
sum(decode(c.name, 'session pga memory', trunc(value/1000),0))||'K' pga_sum,
sum(decode(c.name, 'session uga memory', trunc(value/1000),0))||'K' uga_sum
from v$session a, v$sesstat b, v$statname c
where a.sid = b.sid
and b.statistic# = c.statistic#
and c.name like 'session%';


ttitle '3. Max(peak) pga, pga session memory'

select a.sid, a.username, substr(a.program, 1, 25) as pgm, a.terminal,
max(decode(c.name, 'session pga memory max', trunc(value/1000)||'K', 0)) pga_max,
max(decode(c.name, 'session uga memory max', trunc(value/1000)||'K', 0)) uga_max
from v$session a, v$sesstat b, v$statname c
where a.sid = b.sid
and b.statistic# = c.statistic#
and c.name like 'session%'
group by a.sid, a.username, substr(a.program, 1, 25), a.terminal;


ttitle '4. Sum of max(peak) pga, uga session memory'

select 'Max(peak) PGA, UGA session memory SUM:' as sum,
sum(decode(c.name, 'session pga memory max', trunc(value/1000), 0))||'K' pga_m_sum,
sum(decode(c.name, 'session uga memory max', trunc(value/1000), 0))||'K' uga_m_sum
from v$session a, v$sesstat b, v$statname c
where a.sid = b.sid
and b.statistic# = c.statistic#
and c.name like 'session%';

spool off
set pause off
