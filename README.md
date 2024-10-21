# Notes

## Fix the Error kubeadm init
```
$ rm /etc/containerd/config.toml
$ systemctl restart containerd
$ kubeadm init
```
