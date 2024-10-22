echo "Init kubeadm"
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Apply Calico network"
wget https://docs.projectcalico.org/manifests/calico.yaml
mv calico.yaml srcs/calico.yaml
kubectl apply -f srcs/calico.yaml

echo "Get nodes and pods"
kubectl get nodes
kubectl get pods --all-namespaces

echo "Install dashboard"
wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
mv recommended.yaml srcs/dashboard.yaml
kubectl apply -f srcs/dashboard.yaml
#ssh -L localhost:8001:127.0.0.1:8001 aglorios@192.168.1.169

echo "Done"