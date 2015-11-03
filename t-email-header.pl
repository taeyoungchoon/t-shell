#!/usr/bin/perl

foreach $line (<>) {
    print $line if $line =~ /(^Received: from|^by|^for|^From:|^To:|^Subject:|^X-Mailer:)/;
}

__END__

Received: from mail.so.com ([8.8.8.8])
        by mx.google.com
Received: from jack ([192.168.10.101])
	by mail.so.com
From: =?utf-8?B?
To: 
Subject: =?utf-8?B?

---

jack -> mail.so.com -> mx.google.com
