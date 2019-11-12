resource "aws_s3_bucket" "kops_state" {
    bucket ="${local.kops_state_bucket}"
    acl = "private"

    versioning {
        enabled = true
    }

    tags = {
        environment = "production"
        app = "kops"
    }
}

resource "aws_security_group" "k8s_api_http" {

    name = "${local.environment}_k8s_api_http"
    vpc_id = "${module.vpc.vpc_id}"
    tags = "${local.tags}"

    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = "${local.ingress_ips}"
    }

    ingress {
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_blocks = "${local.ingress_ips}"
   }
}