vgdisplay
vgdisplay -v | grep "PV Name" | grep -v Alter
ioscan -funC disk
ioscan -funC fc
lvdisplay
pvdisplay
fdisk -l
# /dev/sda1 , /dev/mapper/deb01--vg--root
# /dev/sda5 , /dev/mapper/deb01--vg--swap_1
# dmsetup ls
# dmsetup info
