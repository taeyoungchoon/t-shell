virt-install --virt-type kvm --name fai0 \
--location /var/lib/libvirt/images/d.iso \
--os-variant debian11 \
--disk size=20 --memory 2000 \
--graphics none \
--console pty,target_type=serial \
--extra-args "console=ttyS0"
