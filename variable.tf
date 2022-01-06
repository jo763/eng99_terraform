# In this file we will create variables to ise in main.tf
# variable.tf

# Let's create a var for the name of our instance
variable "name"{
  default = "eng99_joseph_app_instance"
}

# Let's create a var for our ami id
variable "app_ami_id"{
  default = "ami-07d8796a2b0f8d29c"
}

# VPC ID
variable "vpc_id"{
  default = "10.0.0.0/16"
}

# VPC ID
variable "cidr_block"{
  default = "10.0.0.0/16"
}

# Public Subnet
variable "aws_public_subnet"{
  default = "eng99_joseph_terraform_public_SN"
}

# Public Subnet
variable "aws_key_name"{
  default = "eng99"
}
