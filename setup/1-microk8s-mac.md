note: the "new" instructions to brew install microk8s natively on mac do NOT work, you have to manually use the old way of dealing with multipass directly.

```
multipass launch --name microk8s-vm --mem 4G --disk 40G

multipass shell microk8s-vm

sudo snap install microk8s --classic --channel=1.18/stable

sudo iptables -P FORWARD ACCEPT

sudo usermod -a -G microk8s $USER

sudo chown -f -R $USER ~/.kube

# log out and back in

microk8s.enable dns

# copy this to local mac
microk8s.config