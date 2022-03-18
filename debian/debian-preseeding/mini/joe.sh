virt-install --virt-type kvm \
	     --name joe \
	     --location /var/lib/libvirt/images/d.iso \
	     --os-variant debian11 \
	     --disk size=20 --memory 2000 \
	     --graphics none \
	     --autoconsole none \
	     --initrd-inject=preseed.cfg \
	     --console pty,target_type=serial \
	     --extra-args "console=ttyS0"
