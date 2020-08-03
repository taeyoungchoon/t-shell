# adduser cloudera
# passwd cloudera
New password: P@ssw0rd
Retype new password: P@ssw0rd
# visudo

[root@jo ~]# cat /etc/sudoers | grep wheel
## Allows people in group wheel to run all commands
# %wheel        ALL=(ALL)       ALL
%wheel  ALL=(ALL)       NOPASSWD: ALL

[root@jo ~]# usermod -aG wheel cloudera

[root@jo ~]# groupmems -g wheel -l
cloudera
