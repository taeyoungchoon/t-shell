openstack baremetal node delete s002
openstack overcloud node import --validate-only ~/stack/instackenv-s002.json
openstack overcloud node import instackenv-s002.json
openstack overcloud node introspect --all-manageable
openstack overcloud node provide --all-manageable

