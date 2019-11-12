terraform  {
    backend "s3" {
         encrypt = true
         bucket = "talad-terraform-state"
         key = "common/prod_build.tfstate"
         region = "ap-southeast-1"
         dynamodb_table = "talad-terraform-state"
    }
}