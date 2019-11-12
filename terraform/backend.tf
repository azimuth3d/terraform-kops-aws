terraform  {
    backend "s3" {
         encrypt = true
         bucket = "terraform-state"
         key = "common/prod_build.tfstate"
         region = "ap-southeast-1"
         dynamodb_table = "terraform-state"
    }
}