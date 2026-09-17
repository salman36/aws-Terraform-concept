terraform {

  backend "s3" {
        bucket         = "suleman-terraform-remote-state-12"
        key            = "dev/project/terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-locks"
        encrypt        = true
    }
    
}