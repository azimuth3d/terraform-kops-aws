aws ec2 create-key-pair --key-name talad_k8s | jq -r '.KeyMaterial' > talad_k8s.pem
mv talad_k8s.pem ~/.ssh/ 
chmod 400 ~/.ssh/talad_k8s.pem
ssh-keygen -y -f ~/.ssh/talad_k8s.pem > ~/.ssh/talad_k8s.pub


ID=$(uuidgen) && \
aws route53 create-hosted-zone \ 
--name talad-k8s.cf \
--caller-reference $ID \
| jq .DelegationSet.NameServers


kops create cluster --name $CLUSTER_NAME --zones ap-southeast-1a --master-zones ap-southeast-1a --master-size t2.small --node-size t2.micro --node-count=3  --state $KOPS_STATE --yes 