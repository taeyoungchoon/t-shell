#servermanagercmd
sc query TlntSvr
sc config TlntSvr start= auto
sc start TlntSvr
tlntadmn config sec=-NTLM
tlntadmn config mode=stream
