#  provider "aws" {
#    region = "us-east-1"
#  }

#  resource "aws_instance" "suleman_ec2" {
#    ami           = "ami-0332d564d76dbd8d6"
#    instance_type = "t3.micro" 

#    tags = {
#      Name = "MyFirstTerraformEC2"
#    }
#  }

# the above method is basic and the below is professional way
# Variables

#provider "aws" {
#    region = var.aws_region
#}

# data is a resource of terraform (bta ha kay abhi koi chez create ni kerni balky dynamic data fetch ker kay ana ha )

#data "aws_ami" "amazon_linux" {
#    most_recent = true
#    owners = ["amazon"]

    # fiter basically use hta ha filter kerny kay ley amazon latest ami images ko (hvm) hardware virtual machine
#    filter {
#        name = "name"
#        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#    }
#}

#resource "aws_instance" "suleman1_ec2" {
#    ami = data.aws_ami.amazon_linux.id
#    instance_type = var.instance_type

#    tags = {
#        Name = var.instance_name
#    }
#}



# Concept of local & Conditional Expressions values in terraform (local values are like variables but they are only used in the current module and they are not passed to other modules)
#provider "aws" {
#    region = var.aws_region
#}

# data is a resource of terraform (bta ha kay abhi koi chez create ni kerni balky dynamic data fetch ker kay ana ha )

#data "aws_ami" "amazon_linux" {
#    most_recent = true
#    owners = ["amazon"]

    # fiter basically use hta ha filter kerny kay ley amazon latest ami images ko (hvm) hardware virtual machine
#    filter {
#        name = "name"
#        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#    }
#}

# local values are like variables but they are only used in the current module and they are not passed to other modules
#locals {
#      name_tag = var.instance_type == "t3.micro" ? "Micro Instance" : "Standard Instance"
#}

#resource "aws_instance" "suleman1_ec2" {
#    ami = data.aws_ami.amazon_linux.id
#    instance_type = var.instance_type

#    tags = {
        # Name = var.instance_name
        # use of local values in tags
#        Name = local.name_tag
#    }
#}





# Dependens on

#provider "aws" {
#    region = var.aws_region
#}

# data is a resource of terraform (bta ha kay abhi koi chez create ni kerni balky dynamic data fetch ker kay ana ha )

#data "aws_ami" "amazon_linux" {
#    most_recent = true
#    owners = ["amazon"]

    # fiter basically use hta ha filter kerny kay ley amazon latest ami images ko (hvm) hardware virtual machine
#    filter {
#        name = "name"
#        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#    }
#}

#resource "aws_s3_bucket" "my_bucket" {
#    bucket = var.bucket_name
   
#    tags = {
#        Name = "MyS3BucketS"
#    }
#}

#resource "aws_instance" "suleman1_ec2" {
#    ami = data.aws_ami.amazon_linux.id
#    instance_type = var.instance_type

#    tags = {
#        Name = var.instance_name
#    }
#    depends_on = [aws_s3_bucket.my_bucket]
#}






# Terraform: Workspaces

#provider "aws" {
#    region = var.aws_region
#}

# data is a resource of terraform (bta ha kay abhi koi chez create ni kerni balky dynamic data fetch ker kay ana ha )

#data "aws_ami" "amazon_linux" {
#    most_recent = true
#    owners = ["amazon"]

    # fiter basically use hta ha filter kerny kay ley amazon latest ami images ko (hvm) hardware virtual machine
#    filter {
#        name = "name"
#        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#    }
#}

#resource "aws_s3_bucket" "my_bucket" {
#    bucket = var.bucket_name
   
#    tags = {
#        Name = "MyS3BucketS"
#    }
#}

#resource "aws_instance" "suleman1_ec2" {
#    ami = data.aws_ami.amazon_linux.id
#    instance_type = var.instance_type

#   tags = {
#        Name = "EC2-${terraform.workspace}"
#        Environment = terraform.workspace
#    }   
#}





# Remote State With S3 + Locking wiht DynamoDB

provider "aws" {
    region = var.aws_region
}

# data is a resource of terraform (bta ha kay abhi koi chez create ni kerni balky dynamic data fetch ker kay ana ha )

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    # fiter basically use hta ha filter kerny kay ley amazon latest ami images ko (hvm) hardware virtual machine
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
   
    tags = {
        Name = "MyS3BucketS"
    }
}

resource "aws_instance" "suleman1_ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

   tags = {
        Name = "SulemanRemoteStateEC2"
    }   
}