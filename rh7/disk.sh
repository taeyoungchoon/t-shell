parted /dev/sdb print
parted /dev/sdb mklabel gpt
parted /dev/sdb mkpart primary ext4 1MiB 100MiB
parted /dev/sdb mkpart primary ext4 100MiB 300MiB
partprobe
part /dev/sdb print
