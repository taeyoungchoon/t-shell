# parted /dev/sdb print
# parted /dev/sdb mklabel gpt
parted /dev/sdb mkpart primary ext4 1MiB 100MiB
parted /dev/sdb mkpart primary ext4 100MiB 300MiB
partprobe
# parted /dev/sdb print
mkfs.ext4 /dev/sdb1
mkfs.xfs -f /dev/sdb2
[ ! -e /1 ] && mkdir /1
[ ! -e /2 ] && mkdir /2
mount /dev/sdb1 /1
mount /dev/sdb2 /2
df -Th
lsblk -f
<<COMMENT
umount /1
umount /2
[ -e /1 ] && rmdir /1
[ -e /2 ] && rmdir /2
parted /dev/sdb print | grep primary | awk '{ print $1 }' | sed 's!^!parted /dev/sdb rm !' | sh
partprobe
COMMENT
