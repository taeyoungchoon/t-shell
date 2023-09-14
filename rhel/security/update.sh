#!/usr/bin/env bash
#
# ref: redhat-security.org

yum update --security --sec-severity Critical
yum update --security --sec-severity Important
yum update --security --sec-severity Moderate
yum update --security --sec-severity Low
