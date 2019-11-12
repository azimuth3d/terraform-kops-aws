module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "production-vpc"
    cidr = "${local.cidr}"
     
    azs = "${local.azs}"
    private_subnets = "${local.private_subnets}"
    public_subnets = "${local.public_subnets}"

    enable_nat_gateway = true
    single_nat_gateway = true
    one_nat_gateway_per_az = false

    private_subnet_tags = {
        "kubernetes.io/role/internal-elb" = 1
    }
    
    public_subnet_tags = {
        "kubernetes.io/role/elb" = 1
    }

    tags = {
        envionment = "${local.environment}"
        "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    }
}