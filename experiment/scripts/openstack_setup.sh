# Change to the parent directory.
cd ../

# Source OpenStack configuration file.
source conf/openstack_config.sh

# Edit OpenStack credentials file to not prompt for password.
sed -i "s/^echo /# echo /g" conf/admin-openrc.sh
sed -i "s/^read /# read /g" conf/admin-openrc.sh
sed -i "s/\$OS_PASSWORD_INPUT/$OPENSTACK_PASSWD/g" conf/admin-openrc.sh

echo "Copying the OpenStack credentials file to your cloud's controller node..."
scp -i ~/.ssh/elba -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no conf/admin-openrc.sh $CLOUDLAB_USERNAME@$OPENSTACK_CTLHOST:.

# Launch VMs: node1 is instantiated on cp-1, node2 is instantiated on cp-2, and
# so on in a circular way.
ssh -i ~/.ssh/elba -T -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o \
    BatchMode=yes $CLOUDLAB_USERNAME@$OPENSTACK_CTLHOST "
  source admin-openrc.sh
  for i in {1..$OPENSTACK_NVIRTUALMACHINES}; do
    cpno=\$((\$i % $OPENSTACK_NCOMPUTINGNODES))
    if [ \$cpno -eq 0 ]; then
      cpno=$OPENSTACK_NCOMPUTINGNODES
    fi
    echo \"Launching VM node\${i} in computing node cp-\${cpno}...\"
    openstack server create \
        --image $OPENSTACK_VMIMAGE \
        --flavor $OPENSTACK_VMFLAVOR \
        --key-name $OPENSTACK_KEYNAME \
        --availability-zone nova:cp-\${cpno}.$CLOUDLAB_EXPNAME.$CLOUDLAB_PROJNAME.$CLOUDLAB_EXPSITE.cloudlab.us \
        --network tun0-net \
        node\${i}
  done
"
