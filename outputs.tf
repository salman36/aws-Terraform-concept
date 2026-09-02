#output "instance_public_ip" {
#    value = aws_instance.suleman1_ec2.public_ip
#}

# use of local values and conditional expressions in output
output "instance_name" {
    value = local.name_tag
}