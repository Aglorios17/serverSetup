# Notes
## Start KubeAdm
```
sudo ./kubectl-script.sh
```

## Disable swap
```
sudo swapoff -a
sudo vim /etc/fstab
#UUID=xxxx-xxxx-xxxx-xxxx none swap sw 0 0
```

## Fix the Error kubeadm init
```
rm /etc/containerd/config.toml
systemctl restart containerd
kubeadm init
```
