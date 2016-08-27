(scanning :using nmap :target t-remoting
	  (login :by root
		 (seeding
		  (generate-sysman (download-t-shell :using ftp))))
	  (login :by sysman
		 (t-chk (t-os t-app) (t-output t-repo))))
(parsing)

(scanning parsing)

(encrypt (id '(ip id pass)) :using sqlite)
(decrypt (id '(ip id pass)) :using sqlite)

'(root mon man)

'(mon usr man adm)
'(sys net sec db)
'(jack)

(t-output (mail txt jabber syslog snmp-trap))

(t-remoting (ssh rdp telnet vnc x-window))

(t-output (t-tmp t-repo))
(t-tmp (/tmp/t-tmp ~/t-tmp))
(t-bin :src ~/sysman/t-shell/os/bin :target ~/bin)
(t-repo /repo/state/hostname-ip/20160824.105123/)

(t-os (uptime :output uptime)
      (memory :output t-free)
      (disk :output t-df)
      (lvm :output t-lvm)
      (iscsi :output t-iscsi)
      (nfs :output t-nfs)
      (cifs :output t-cifs)
      (fc :output t-fc)
      (backup :using t-backup))

(t-app (t-oracle alert.log diskspace listen)
       (t-mysql replication)
       (t-weblogic java)
       (t-tomcat java)
       (t-doubletake log)
       (t-dbsec log)
       (t-iis 80 443)
       (t-apache 80 443)
       (t-sap)
       (t-ntp ntpq))
