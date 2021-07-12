openstack baremetal node delete s003
openstack overcloud node import instackenv-s003.json
openstack overcloud node introspect --all-manageable
openstack overcloud node provide --all-manageable

