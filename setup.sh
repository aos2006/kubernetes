# Initialize variables
# Run 'doctl compute region list' for a list of available regions

# Download DigitalOcean CLI

# Generate SSH Keys

# Import SSH Keys

# Create Tags

# Generate token and insert into the script files
TOKEN=`python -c 'import random; print "%0x.%0x" % (random.SystemRandom().getrandbits(3*8), random.SystemRandom().getrandbits(8*8))'`
sed -i.bak "s/^TOKEN=.*/TOKEN=${TOKEN}/" ./master.sh
sed -i.bak "s/^TOKEN=.*/TOKEN=${TOKEN}/" ./node.sh

# Create Master

# Retrieve IP address of Master
MASTER_ID=`doctl compute droplet list | grep "master" |cut -d' ' -f1`
MASTER_IP=`doctl compute droplet get $MASTER_ID --format PublicIPv4 --no-header`

# Download Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Run this after a few minutes. Wait till Kubernetes Master is up and running

# Update Script with MASTER_IP

# Join Nodes

# Confirm the creation of Nodes
kubectl --kubeconfig ./admin.conf get nodes

# Deploy an App
kubectl --kubeconfig ./admin.conf create  -f todo-all-in-one.yaml

# Get the NodePort


