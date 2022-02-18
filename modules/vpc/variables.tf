variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"


}
variable "tenancy" {
  type    = string
  default = "default"

}

variable "name" {
  type    = string
  default = "ebs-vpc"

}
