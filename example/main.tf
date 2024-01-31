module "ec2" {
  source                 = "git::https://github.com/shivendra-pratap-compunnel/aws_ec2_ebs_module.git"
  ami                    = "ami-0c7217cdde317cfec"
  instance_name          = "example_ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0dbfd494bed5e28dd"]
  ebs_size               = "9"
  ebs_type               = "gp3"
}

