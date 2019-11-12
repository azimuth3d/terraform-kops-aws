locals {
    cluster_name = "k8s-domain.name"
    cidr = "10.0.0.0/16"
    azs = ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
    private_subnets = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
    public_subnets = ["10.0.101.0/24","10.0.102.0/24","10.0.103.0/24"]
    environment = "production"
    kops_state_bucket = "kops-state"
    ingress_ips = ["10.0.0.100/32","10.0.0.101/32","10.0.0.102/32"]

    tags = {
      environment = "${local.environment}"
      terraform = true
    }


}