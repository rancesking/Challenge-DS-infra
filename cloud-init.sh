#!/bin/bash
#Add user and password to the instance
user=$VAR_USER
password=$VAR_PASSWORD

# Create user and give sudo access
useradd -m -s /bin/bash ${user}
echo "${user}:${password}" | chpasswd
echo "${user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update SSH config
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart sshd

#Install MicroK8S
sudo snap install microk8s --classic --channel=1.28
sudo usermod -a -G microk8s ${user}
sudo chown -f -R ${user} ~/.kube
microk8s status --wait-ready
sleep 5
microk8s enable dns ingress 

echo "I'm Ready to go"
