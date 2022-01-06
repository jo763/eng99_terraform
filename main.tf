# Let Terraform know who is our cloud provider

# AWS plugins/dependencies will be downloaded
provider "aws"{
  region = "eu-west-1"
  # Allow TF to create services in Ireland

}
# Let's start with launching an EC2 instance using TF
resource "aws_instance" "app_instance" {
  ami = var.app_ami_id
  instance_type = "t2.micro"
  # Enable public IP
  associate_public_ip_address = true
  tags = {
    Name = "eng99_joseph_terraform_app"
  }
  # added eng99.pem so one can ssh
  # Ensure we have this key in the .ssh folder
  key_name = var.aws_key_name
}

module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eng99_joseph_terraform_VPC"
  cidr = var.cidr_block

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name = "eng99_joseph_terraform_VPC"
    Terraform = "true"
    Environment = "dev"
  }
}
# To intialise we use terraform init
# terraform plan
# terraform apply
# terraform destroy
