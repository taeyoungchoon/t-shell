virt-install \ 
  --name c0 \ 
  --memory 512 \ 
  --vcpus 1 \ 
  --disk size=8 \ 
  --os-variant rhel7 \
  --cdrom \
  --network=bridge:br0 \
  --initrd-inject ks.cfg \ 
  --extra-args="ks=file:/ks.cfg console=tty0 console=ttyS0,115200n8" 
