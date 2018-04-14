#!/usr/bin/env bash

disk=$1
cmd=$2

if test $# -ne 2; then 
	echo $0 DISK COMMAND
	echo list of COMMAND :
	cat $0 | grep -E "\w\)" | sed 's/)//'
	exit 1; 
fi

function msg ()
{
	echo =========================================
	echo $*
	echo =========================================
}

case $cmd in 
	print)
		gdisk -l $disk
		msg "print partion table"
		;;
	label-gpt|gpt|label)
		parted $disk mklabel gpt 
		msg "gpt parition table is made"
		;;
	label-msdos|msdos|dos)
		parted $disk mklabel msdos
		msg "mbr partition table is made"
		;;
	mkpart)
		if test $( parted /dev/sdc print 2>&1 | grep "unrecognised disk label" | wc -l ) -eq 1; then
			msg "labeling first"
			exit 1
		fi

		if test $( parted $disk unit MiB print | grep MiB | wc -l ) -eq 1; then
			start="1MiB"
			start_p=$( echo $start | sed 's/MiB//' )
		else
			start=$( parted $disk unit MiB print | grep MiB | tail -1 | awk '{ print $3 }')
		fi

		index=$( parted $disk unit MiB print | grep MiB | tail -1 | awk '{ print $1 }')
		next=$(( $index + 1 ))
		start_number=$( echo $start | sed 's/MiB//' )
		end_number=$( echo $start_number + 100.0 | bc )
		end=$( echo ${end_number}MiB )

		parted $disk unit MiB mkpart primary $start $end
		sgdisk $disk -t ${next}:8300
		gdisk -l $disk
		msg "Linux FileSystem partion(100MiB) is made"
		;;
	clear)
		rpm -qi gdisk 1>/dev/null 2>/dev/null
		if test $? -ne 0; then
			yum install gdisk -y  1>/dev/null 2>/dev/null
			msg "gdisk downloaded and installed"
		fi
		sgdisk -Z $disk
		msg "clear, done"
		;;
esac

<<COMMENT
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

umount /1
umount /2
[ -e /1 ] && rmdir /1
[ -e /2 ] && rmdir /2
parted /dev/sdb print | grep primary | awk '{ print $1 }' | sed 's!^!parted /dev/sdb rm !' | sh
partprobe

sgdisk -Z /dev/sdc
parted /dev/sdc mklabel gpt mkpart primary 0% 100%
parted /dev/sdc print

sgdisk -Z /dev/sdc
parted /dev/sdc mklabel msdos mkpart primary 0% 100%
parted /dev/sdc print

sgdisk -Z /dev/sdc
COMMENT

