rpm -q openssh-askpass
if [[ $? == 0 ]]; then
  yum localinstall -y --disablerepo=* openssh-8.0p1-19.el8_8.x86_64.rpm openssh-askpass-8.0p1-19.el8_8.x86_64.rpm openssh-clients-8.0p1-19.el8_8.x86_64.rpm openssh-server-8.0p1-19.el8_8.x86_64.rpm
else
  yum localinstall -y --disablerepo=* openssh-8.0p1-19.el8_8.x86_64.rpm openssh-clients-8.0p1-19.el8_8.x86_64.rpm openssh-server-8.0p1-19.el8_8.x86_64.rpm
fi
