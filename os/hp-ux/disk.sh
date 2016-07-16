bdf
ls /usr/sbin | grep display
/usr/sbin/vgdisplay -v | grep Name | grep -v Alter | more
/usr/sbin/lvdisplay -v /dev/vg00/lvol1
/usr/sbin/pvdisplay -v /dev/dsk/c16t6d0
