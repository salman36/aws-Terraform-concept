#output "instance_public_ip" {
#    value = aws_instance.suleman1_ec2.public_ip
#}

# use of local values and conditional expressions in output
#output "instance_name" {
#    value = local.name_tag
#}

# use of Dependens on in output
#output "bucket_name" {
#    value = aws_s3_bucket.my_bucket.id
#}

# Workspaces in output
output "workspace_name" {
    value = "EC2-${terraform.workspace}"
}