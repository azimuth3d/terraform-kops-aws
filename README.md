## Terraform Provisioning for kops (Kubernetes Operator) on AWS 

Terraform configurations to create 1 vpc , 3 subnet pairs ( public and private) for 3 available for kubernetes master deploy 

1. You can use terraform plan and apply to privision resource we need for create new cluster 
2. execute deploy.sh in kops folder to generate kubernetes.tf from template.yaml that we specified 
3. apply for kubernetes cluster deployment

