module "vpc" {
  source = "github.com/terraform-community-modules/tf_aws_vpc"

  name           = "ctrl"
  cidr           = "172.16.0.0/16"
  public_subnets = ["172.16.42.0/24"]
  azs            = ["${var.aws_default_region}c"]
}

module "security_groups" {
  source = "github.com/lsst-sqre/tf_aws_security_groups"

  vpc_id = "${module.vpc.vpc_id}"
  tag    = "ctrl"
}
