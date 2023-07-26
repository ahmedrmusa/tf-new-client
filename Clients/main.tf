provider "aws" {
  region = "${local.client_vars.aws_region}"
}

module "security_group" {
  source        = "../modules/security_group"
  vpc_id        = "${local.client_vars.vpc_id}"
  app_sg   = "app_sg"
  db_sg    = "db_sg"
  alb_sg   = "alb_sg"
}


module "ec2" {
  source              = "../modules/ec2"
  
  ami_id              = local.ami_id
  user_data           = "${local.client_vars.user_data}"
  key_name            = "${local.client_vars.client_name}-key"
  instance_name       = "${local.client_vars.client_name}-windows-ec2"
  instance_type       = "${local.client_vars.instance_type}"
  subnet_id           = local.client_vars.private_subnet_id
  security_group_ids  = [module.security_group.app_sg_id]
}

module "rds" {
  source               = "../modules/rds"

  allocated_storage    = local.allocated_storage
  instance_class       = local.instance_class
  db_name              = "${local.client_vars.client_name}-rds-db"
  db_user              = local.client_vars.db_user
  db_password          = local.client_vars.db_password
  security_group_ids   = [module.security_group.db_sg_id]
}

module "alb" {
  source              = "../modules/alb"
  
  alb_name            = "${local.client_vars.client_name}-alb"
  subnet_ids          = "${local.client_vars.subnet_ids}"
  vpc_id              = "${local.client_vars.vpc_id}"
  ssl_certificate_id  = "${local.client_vars.alb-ssl-cert-id}"
  security_group_ids  = [module.security_group.alb_sg_id]
  alb_sg              = module.security_group.alb_sg_id
  db_sg               = module.security_group.db_sg_id
}

module "vpc_endpoint_service" {
  source                  = "../modules/vpc_endpoint_service"
  alb_arn                 = module.alb.alb_arn
}

#TODO: Add s3 backend for state management