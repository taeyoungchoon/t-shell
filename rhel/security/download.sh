#!/usr/bin/env bash
#
# ref: redhat-security.org

yum update --exclude=kernel* --sec-severity=Important  --downloadonly --downloaddir=.
yum update --exclude=kernel* --sec-severity=Critical  --downloadonly --downloaddir=.
yum update --exclude=kernel* --sec-severity=Moderate  --downloadonly --downloaddir=.
yum update --exclude=kernel* --sec-severity=Low  --downloadonly --downloaddir=.
