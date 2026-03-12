provider "aws" {
  region = "ap-south-1"
}

# Create VPC
module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "192.168.0.0/16"
  vpc_name    = "My-VPC"
}

# Create EC2 instance inside the VPC
module "ec2" {
  source        = "./modules/ec2-instances"
  ami           = "ami-02ddb77f8f93ca4ca"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.vpc_id
  instance_name = "Web-Server"
}

# Create S3 Bucket
module "s3" {
  source      = "./modules/s3-bucket"
  bucket_name = "my-awesome-bucket-reya"
  acl         = "private"
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
