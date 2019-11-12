## Terraform Provisioning for KOPS (Kubernetes Operator) on AWS 

Terraform configurations to create 1 vpc , 3 subnet pairs ( public and private) for 3 available for kubernetes master deploy 

##### Following this step 
1. Use terraform plan and apply to privision resource we need for create new cluster 
2. Execute "deploy.sh" in "kops" folder to generate kubernetes.tf from template.yaml that we have specified 
3. Apply for kubernetes cluster deployment

