echo 'timedatectl: set timezone'
timedatectl set-timezone Asia/Seoul

echo 'sshd: enable password authentication'
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl reload sshd

echo 'pkg: install essential packages'
yum install -y git emacs-nox vim psmisc bash-completion strace procps-ng coreutils grep

echo 'git: git clone t-shell'
cd /root; git clone https://github.com/taeyoungchoon/t-shell.git

echo 'man: rel'
yum update -y pam
yum reinstall -y shadow-utils sysvinit-tools
