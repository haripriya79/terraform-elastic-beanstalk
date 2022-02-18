variable "subnet_cidr" {
  type  = string
  default = "10.0.1.0/24"


}
variable "vpc_id" {
  type = string

}
variable "availability_zone" {
  type = string
  default = "us-east-1"
  
}

variable "name" {
  type  = string
  default= "ebs-subnet"
  

}


