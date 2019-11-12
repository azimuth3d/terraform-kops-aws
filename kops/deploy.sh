#!/usr/bin/env bash

set -e -o pipefail

TF_OUTPUT=$(cd ../terraform && terraform output -json)
CLUSTER_NAME="$(echo ${TF_OUTPUT} | jq -r .cluster_name.value)"
kops toolbox template --name ${CLUSTER_NAME} --values <( echo ${TF_OUTPUT}) --template template.yaml --format-yaml > cluster.yaml
STATE="s3://$(echo ${TF_OUTPUT} | jq -r .kops_s3_bucket_name.value)"
kops replace -f cluster.yaml --state ${STATE} --name ${CLUSTER_NAME} --force 
kops create secret --name ${CLUSTER_NAME} --state ${STATE} --name ${CLUSTER_NAME}  sshpublickey admin -i ~/.ssh/id_rsa.pub
kops update cluster --target terraform --state ${STATE} --name ${CLUSTER_NAME} --out .

terraform plan -lock=false
terraform apply -lock=false





