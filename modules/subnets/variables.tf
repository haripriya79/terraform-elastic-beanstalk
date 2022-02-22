variable "subnet_cidr_1" {
  type  = string
 

}
variable "subnet_cidr_2" {
  type  = string


}
variable "vpc_id" {
  type = string

}
variable "availability_zone" {
  type = string
  default = "us-east-1a"
  
}

variable "name" {
  type  = string
  default= "ebs-subnet"
  

}


