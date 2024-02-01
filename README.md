# EC2 instance with EBS volume attachment

Configuration in this module creates EC2 instances, EBS volume and attach it together.

# Usage

## This needs to put in main.tf file (Required)

```hcl
module "ec2" {
  source                 = "git::https://github.com/CD-TeraformModules/aws-ec2-with-ebs.git"
  ami                    = "ami-0c7217cdde317cfec"
  instance_name          = "example_ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0dbfd494fgd5e28dd"]
  ebs_size               = "9"
  ebs_type               = "gp3"
}
```

## This needs to put in provider.tf file (Required)

```hcl
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.34.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

## This needs to put in outputs.tf file (Optional)

```hcl
output "ec2_ebs_all_ouputs" {
  description = "All outputs"
  value       = module.ec2
}
```

NOTE - By default EBS volume will be root and one additional. This can be increased to a maximum of 3.

NOTE - By Default encryption is enabled on EBS Volume.

NOTE - By Default EBS volume size is 8GB.
