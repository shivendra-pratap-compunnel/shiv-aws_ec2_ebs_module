################################################################################
# EC2 Module Wrapper
################################################################################
module "aws_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  # subnet_id                   = element(module.vpc.private_subnets, 0)
  # vpc_security_group_ids      = [module.security_group.security_group_id]
  # tags                        = local.tags
  #########################################################
  name                                 = var.instance_name
  instance_type                        = var.instance_type
  associate_public_ip_address          = var.associate_public_ip_address
  availability_zone                    = var.availability_zone
  ami                                  = var.ami
  create                               = var.create
  ami_ssm_parameter                    = var.ami_ssm_parameter
  ignore_ami_changes                   = var.ignore_ami_changes
  maintenance_options                  = var.maintenance_options
  capacity_reservation_specification   = var.capacity_reservation_specification
  cpu_credits                          = var.cpu_credits
  disable_api_termination              = var.disable_api_termination
  ebs_block_device                     = var.ebs_block_device
  ebs_optimized                        = var.ebs_optimized
  enclave_options_enabled              = var.enclave_options_enabled
  ephemeral_block_device               = var.ephemeral_block_device
  get_password_data                    = var.get_password_data
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_tags                        = var.instance_tags
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  key_name                             = var.key_name
  launch_template                      = var.launch_template
  metadata_options                     = var.metadata_options
  monitoring                           = var.monitoring
  network_interface                    = var.network_interface
  private_dns_name_options             = var.private_dns_name_options
  placement_group                      = var.placement_group
  private_ip                           = var.private_ip
  root_block_device                    = var.root_block_device
  secondary_private_ips                = var.secondary_private_ips
  source_dest_check                    = var.source_dest_check
  subnet_id                            = var.subnet_id
  tenancy                              = var.tenancy
  user_data                            = var.user_data
  user_data_base64                     = var.user_data_base64
  user_data_replace_on_change          = var.user_data_replace_on_change
  volume_tags                          = var.volume_tags
  enable_volume_tags                   = var.enable_volume_tags
  vpc_security_group_ids               = var.vpc_security_group_ids
  timeouts                             = var.timeouts
  cpu_options                          = var.cpu_options
  cpu_core_count                       = var.cpu_core_count
  cpu_threads_per_core                 = var.cpu_threads_per_core
  create_spot_instance                 = var.create_spot_instance
  spot_price                           = var.spot_price
  spot_wait_for_fulfillment            = var.spot_wait_for_fulfillment
  spot_type                            = var.spot_type
  spot_launch_group                    = var.spot_launch_group
  spot_block_duration_minutes          = var.spot_block_duration_minutes
  spot_instance_interruption_behavior  = var.spot_instance_interruption_behavior
  spot_valid_until                     = var.spot_valid_until
  spot_valid_from                      = var.spot_valid_from
  disable_api_stop                     = var.disable_api_stop
  create_iam_instance_profile          = var.create_iam_instance_profile
  iam_role_name                        = var.iam_role_name
  iam_role_use_name_prefix             = var.iam_role_use_name_prefix
  iam_role_path                        = var.iam_role_path
  iam_role_description                 = var.iam_role_description
  iam_role_permissions_boundary        = var.iam_role_permissions_boundary
  iam_role_policies                    = var.iam_role_policies
  iam_role_tags                        = var.iam_role_tags
}

#######################################################
# EBS Resource & Attachment
#####################################################
resource "aws_ebs_volume" "volume" {
  count             = var.ebs_count
  availability_zone = module.aws_ec2.availability_zone
  size              = var.ebs_size
  # tags              = local.tags
  final_snapshot = var.final_snapshot
  #iops               = (optional) #The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3.
  #multi_attach_enabled = (optional) #Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported on io1 and io2 volumes.
  #snapshot_id        = (optional) # A snapshot to base the EBS volume off of.
  #outpost_arn        = (optionnal) #The Amazon Resource Name (ARN) of the Outpost.
  type      = var.ebs_type
  encrypted = true
  # kms_key_id        = (optional) #The ARN for the KMS encryption key
  # throughput        = (optional) # The throughput that the volume supports, in MiB/s. Only valid for type of gp3
}

resource "aws_volume_attachment" "attach" {
  count       = var.ebs_count
  device_name = var.device_name[count.index % length(var.device_name)]
  volume_id   = aws_ebs_volume.volume[count.index].id
  # volume_id                      = aws_ebs_volume.volume.id  #have conflicts with count
  instance_id                    = module.aws_ec2.id
  force_detach                   = var.force_detach
  skip_destroy                   = var.skip_destroy
  stop_instance_before_detaching = var.stop_instance_before_detaching
}







