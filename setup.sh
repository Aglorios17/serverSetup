echo "verif..."
minikube stop
minikube delete --all

#echo "Brew Minikube..."
#brew install minikube

echo "Minikube start..."
minikube start --driver=virtualbox --memory='3000' --disk-size 10000MB

echo "addons..."
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons list

echo "new cluster..."
minikube kubectl -- get po -A

echo "Minikube dashboard..."
minikube dashboard &