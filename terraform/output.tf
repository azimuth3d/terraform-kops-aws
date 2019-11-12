output "region" {
   value = "ap-southeast-1"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "public_subnet_ids" {
  value = "${module.vpc.public_subnets}"
}

output "public_route_table_ids" {
  value = "${module.vpc.public_route_table_ids}"
} 

output "private_subnet_ids" {
  value = "${module.vpc.private_subnets}"
}

output "private_roiute_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}

output "default_security_group_id" {
    value = "${module.vpc.default_security_group_id}"
}

output "nat_gateway_ids" {
   value = "${module.vpc.natgw_ids}"
}

output "availability_zones" {
   value = "${local.azs}"
}

output "kops_s3_bucket_name" {
    value = "${aws_s3_bucket.kops_state.bucket}"

}

output "cluster_name" {
    value = "${local.cluster_name}"
}

output "k8s_api_http_security_group_id" {
    value = "${aws_security_group.k8s_api_http.id}"
}