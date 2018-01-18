#/bin/bash

read -p "Are you sure? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

 curr_path=`pwd`
 cd /root/openstackdeploy
 ansible-playbook playbooks/prepare-for-openstack.yml
 kolla-ansible bootstrap-servers -i /root/openstackdeploy/inventory/region/hosts
 kolla-ansible deploy -i /root/openstackdeploy/inventory/region/hosts
 kolla-ansible post-deploy -i /root/openstackdeploy/inventory/region/hosts
 ansible-playbook playbooks/configure-openstack.yml
 cd $pwd

else

 echo "bye bye"

fi

