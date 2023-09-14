#!/usr/bin/env bash
#
# ref: redhat-security.org

yum updateinfo list updates --sec-severity=Low
yum updateinfo list updates --sec-severity=Critical
yum updateinfo list updates --sec-severity=Moderate
yum updateinfo list updates --sec-severity=Important
