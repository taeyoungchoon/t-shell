virsh shutdown c0
virsh domstate c0
virsh undefine c0
virsh vol-delete c0.qcow2 --pool default
