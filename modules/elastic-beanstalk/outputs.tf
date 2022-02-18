output "cname" {
  value = aws_elastic_beanstalk_environment.web_environment.cname
}

output "envName" {
  value = aws_elastic_beanstalk_environment.web_environment.name
}

output "asgName" {
  value = aws_elastic_beanstalk_environment.web_environment.autoscaling_groups
}


output "lbarn" {
  value = aws_elastic_beanstalk_environment.web_environment.load_balancers
}

output "endpoint-url" {

  value = aws_elastic_beanstalk_environment.web_environment.endpoint_url
}
