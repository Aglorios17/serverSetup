echo "# Add Docker's official GPG key:"
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "# Add the repository to Apt sources:"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
echo "# Install Docker:"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "# Verify that Docker is installed correctly by running the hello-world image:"
sudo docker run hello-world
echo "# Add your user to the docker group:"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
echo "# Enable and start the Docker service:"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
