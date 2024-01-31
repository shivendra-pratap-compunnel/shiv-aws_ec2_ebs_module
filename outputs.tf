# EC2 Outputs
output "ec2_id" {
  description = "The ID of the instance"
  value       = module.aws_ec2.id
}

output "ec2_arn" {
  description = "The ARN of the instance"
  value       = module.aws_ec2.arn
}

output "ec2_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.aws_ec2.capacity_reservation_specification
}

output "ec2_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.aws_ec2.instance_state
}

output "ec2_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.aws_ec2.primary_network_interface_id
}

output "ec2_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.aws_ec2.private_dns
}

output "ec2_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.aws_ec2.public_dns
}

output "ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.aws_ec2.public_ip
}

output "ec2_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = module.aws_ec2.tags_all
}

output "ec2_availability_zone" {
  description = "The availability zone of the created spot instance"
  value       = module.aws_ec2.availability_zone
}

#EBS Outputs
output "ebs_volume_ids" {
  value = aws_ebs_volume.volume[*].id
}

output "ebs_volume_type" {
  value = aws_ebs_volume.volume[*].type
}

output "ebs_volume_size" {
  value = aws_ebs_volume.volume[*].size
}

output "ebs_volume_arns" {
  value = aws_ebs_volume.volume[*].arn
}

