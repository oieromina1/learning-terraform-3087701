variable "instance_type" {
description = "Type of EC2 instance to provision"
default     = "t3.nano"
}
variable = "ami_filter"{
description = "Name filter and owner for AMI"

    type = object ({
    name = string
   owner = string
  })
 default = {
    name = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
   owner = "979382823631" # Bitnami
}
}
variable = "environment"{
description = "Development Environment"

 type = object({
 name          = string
network_prefix = string
})
default = {
  name = "dev"
  network_prefix = "10.0"
  }
}

ingress_rules      = ["http-80-tcp", "https-443-tcp"]
ingress_cidr_blocks = [0.0.0.0/0]

egress_rules      = ["all-all"]
egress_cidr_blocks = [0.0.0.0/0]
}

resource "aws_security_group" "blog" {
name  = "blog"
description = "Allow http and https in. Allow everything out"
vpc_id = module.vpc.public_subnets[0]
}
}
