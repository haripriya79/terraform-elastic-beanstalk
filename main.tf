provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAV3DEG4WJL7RRVFEO"
  secret_key = "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"
}

module "ebs_vpc" {
  source     = "./modules/vpc"
  cidr_block = "173.0.0.0/16"
  //tenancy = "default"
  //name = "ebs_vpc"  
}

module "ebs_subnet" {
  source            = "./modules/subnets"
  subnet_cidr_1       = "173.0.0.0/24"
  subnet_cidr_2 = "173.0.1.0/24"
  vpc_id            = module.ebs_vpc.ebs_vpc_id
  availability_zone = "us-east-1a"
  name              = "ebs_subnet_1"

}

module "ebs_security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.ebs_vpc.ebs_vpc_id


}

module "ebs_source_bucket" {
  source      = "./modules/s3-bucket"
  version_app     = "1.0.0"
  bucket_name = "ebs-web-app-bucket-06965"

}
module "ebs_iam_roles" {
  source = "./modules/iam-roles"
  ebs_name   = "ebs_service_role_1"


}

module "ebs_web_java_app" {
  source           = "./modules/elastic-beanstalk"
  application_name = "web-app-12"
  //sources
  source_bucket_id     = module.ebs_source_bucket.s3_bucket_web_app_id
  source_bucket_key_id = module.ebs_source_bucket.s3_bucket_web_app_object_id
  //app version name
  version_name = "web-java-app-1.0.0"
  //env name
  env_name            = "web-java-app-env-3"
  solution_stack_name = "64bit Amazon Linux 2 v4.2.11 running Tomcat 8.5 Corretto 11"
  //vpc_id              = "vpc-0135de2d85bda89c4"
  //public_subnet_id    = "subnet-08f61b938f7ee41eb"
  vpc_id = module.ebs_vpc.ebs_vpc_id
  public_subnet_id = ["${module.ebs_subnet.ebs_subnet_id_1}","${module.ebs_subnet.ebs_subnet_id_2}"]
  instance_type       = "t2.micro"
  security_group_id   = module.ebs_security_groups.ebs_security_group_id
  key_pair_name       = "ebs-key-pair"
  ebs_role_id =  module.ebs_iam_roles.ebs_role_name


}
