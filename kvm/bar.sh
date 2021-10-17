virt-install \
   --name c1 --ram 1024 \
   --disk path=cirros-0.3.5.img,format=raw \
   --os-variant fedora25 --nographics \
   --import
