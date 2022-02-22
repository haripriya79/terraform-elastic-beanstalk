variable "application_name" {
  type    = string
  default = "web_app"

}

variable "source_bucket_id" {
  type = string

}
variable "source_bucket_key_id" {
  type = string
}
variable "version_name" {
  type   = string
  default = "web_app_1.0.0"

}
variable "env_name" {
  type = string
}
variable "solution_stack_name" {
  type   = string
  default = "64bit Amazon Linux 2 v4.2.11 running Tomcat 8.5 Corretto 11"

}
variable "vpc_id" {
  type = string
}
variable "public_subnet_id" {
  type = list(string)

}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "security_group_id" {
  type = string

}
variable "ebs_role_id" {
  type = string
}

variable "delete_logs_on_terminate" {
  default = "false"
}
variable "key_pair_name" {
  type = string
}

