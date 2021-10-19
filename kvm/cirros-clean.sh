virsh shutdown ci0
virsh domstate ci0
virsh vol-delete ci0.qcow2 --pool images
