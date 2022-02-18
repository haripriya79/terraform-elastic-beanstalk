
resource "aws_elastic_beanstalk_application" "beanstalk_java_app" {
  name        = var.application_name
  description = "The description of my application"
}

resource "aws_elastic_beanstalk_application_version" "beanstalk_java_app_version" {
  application = aws_elastic_beanstalk_application.beanstalk_java_app.name
  bucket      = var.source_bucket_id
  key         = var.source_bucket_key_id
  name        = var.version_name
}


resource "aws_elastic_beanstalk_environment" "web_environment" {
  application         = aws_elastic_beanstalk_application.beanstalk_java_app.name
  name                = "${var.env_name}"
  solution_stack_name = var.solution_stack_name
  version_label       = aws_elastic_beanstalk_application_version.beanstalk_java_app_version.name
  tier                = "WebServer"
  tags = {
    APP_NAME = var.application_name
  }


  setting {
    name      = "EnvironmentType"
    namespace = "aws:elasticbeanstalk:environment"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }

  # setting {
  #   namespace = "aws:ec2:vpc"
  #   name      = "ELBSubnets"
  #   value     = var.public_subnet_id
  # }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.public_subnet_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    name      = "InstanceType"
    namespace = "aws:autoscaling:launchconfiguration"
    value     = var.instance_type
  }

  # setting {
  #   name      = "SecurityGroups"
  #   namespace = "aws:autoscaling:launchconfiguration"
  #   value     = var.security_group_id
  # }
  # setting {
  #   namespace = "aws:autoscaling:asg"
  #   name      = "MinSize"
  #   value     = 1
  # }
  # setting {
  #   namespace = "aws:autoscaling:asg"
  #   name      = "MaxSize"
  #   value     = 2
  # }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.ebs_role_id
  }

  setting {
    name      = "StreamLogs"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    value     = "true"
  }

  setting {
    name      = "DeleteOnTerminate"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    value     = var.delete_logs_on_terminate
  }

  setting {
    name      = "EC2KeyName"
    namespace = "aws:autoscaling:launchconfiguration"
    value     = var.key_pair_name
  }

  setting {
    name      = "SystemType"
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    value     = "enhanced"
  }

  # setting {
  #   name      = "Application Healthcheck URL"
  #   namespace = "aws:elasticbeanstalk:application"
  #   value     = "/health"
  # }
  # setting {
  #   namespace = "aws:elasticbeanstalk:environment:process:default"
  #   name      = "Port"
  #   value     = 80
  # }
  # setting {
  #   namespace = "aws:elasticbeanstalk:environment:process:default"
  #   name      = "Protocol"
  #   value     = "HTTP"
  # }

}





