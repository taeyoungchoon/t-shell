virt-install --install debian11 \
	--name fai0 \
	--unattended admin-password-file=passing,user-password-file=passing,profile=jeos,user-login=jack
#	--network virbr1 \
#	--extra-args "ip=192.168.33.250::192.168.33.1:255.255.255.0" \

# https://kb.novaordis.com/index.php/Virt-install_Examples
