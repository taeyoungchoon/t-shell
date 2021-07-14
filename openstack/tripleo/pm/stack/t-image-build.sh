# https://docs.openstack.org/project-deploy-guide/tripleo-docs/latest/deployment/install_overcloud.html

export DIB_YUM_REPO_CONF="/etc/yum.repos.d/delorean*"
export STABLE_RELEASE="queens"

mkdir image_built
cd image_built
