virsh shutdown ci0
virsh domstate ci0
virsh vol-delete ci0-image.qcow2 --pool images
