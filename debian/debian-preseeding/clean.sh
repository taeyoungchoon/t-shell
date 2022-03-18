virsh list --all
virsh destroy d01
virsh undefine d01 --remove-all-storage
virsh list --all
