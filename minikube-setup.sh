curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

sudo apt-get install docker-compose-plugin

minikube start --driver docker
minikube addons enable dashboard
minikube dashboard &