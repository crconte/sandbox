#!/bin/bash
echo '  IdentitiesOnly yes' >> ~/.ssh/config
mv .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory .vagrant/provisioners/ansible/inventory/backup_vagrant_ansible_inventory
echo '[all:vars]' > .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo '#ansible_python_interpreter=/usr/bin/python3' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo '[all:children]' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo 'compute' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo 'spine' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo 'leaf' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo '# Generated by Vagrant' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
echo '[spine]' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
while read p; do
  if [[ $p == s[1-9]* ]]
    then
      echo "$p" >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
  fi
done < .vagrant/provisioners/ansible/inventory/backup_vagrant_ansible_inventory
echo '[leaf]' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
while read p; do
  if [[ $p == l[1-9]* ]]
    then
      echo "$p" >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
  fi
done < .vagrant/provisioners/ansible/inventory/backup_vagrant_ansible_inventory
echo '[compute]' >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
while read p; do
  if [[ $p == c[1-9]* ]]
    then
      echo "$p" >> .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
  fi
done < .vagrant/provisioners/ansible/inventory/backup_vagrant_ansible_inventory
