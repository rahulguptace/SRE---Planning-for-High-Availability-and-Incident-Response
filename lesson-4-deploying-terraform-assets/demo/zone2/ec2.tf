  module "project_ec2" {
   source             = "./modules/ec2"
   instance_count     = 2
   aws_ami            = "ami-00ddc330f6182b5cb"
   public_subnet_ids  = module.vpc.public_subnet_ids
   vpc_id             = module.vpc.vpc_id
   cidr_block         = "10.100.0.0/16"
 }