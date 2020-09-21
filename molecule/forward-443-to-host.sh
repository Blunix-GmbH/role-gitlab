#!/bin/bash
#
# Expose port 443 to the workstation running vagrant on 8443 to access gitlab for development


ssh vagrant@127.0.0.1 -p 2222 -i /tmp/molecule/role-gitlab/default/.vagrant/machines/bullseye/virtualbox/private_key -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s -o IdentitiesOnly=yes -o StrictHostKeyChecking=no 'sudo cp -r /home/vagrant/.ssh /root; sudo chown -R root:root /root/.ssh'
ssh -L 8443:127.0.0.1:443 -N root@127.0.0.1 -p 2222 -i /tmp/molecule/role-gitlab/default/.vagrant/machines/bullseye/virtualbox/private_key -o UserKnownHostsFile=/dev/null -o ControlMaster=auto -o ControlPersist=60s -o IdentitiesOnly=yes -o StrictHostKeyChecking=no
