module "backend" {
  source = "./backend"

  # Global variables
  region       = var.region
  project_name = var.project_name
  environment  = var.environment

  # secrets manager variables
  secrets_manager_secret_name = var.secrets_manager_secret_name

  # rds variables
  multi_az_deployment          = var.multi_az_deployment
  database_instance_identifier = var.database_instance_identifier
  database_instance_class      = var.database_instance_class
  publicly_accessible          = var.publicly_accessible

  # s3 variables
  env_file_bucket_name = var.env_file_bucket_name
  env_file_name        = var.env_file_name

  # ecs variables
  architecture = var.architecture
  image_name   = var.image_name
  image_tag    = var.image_tag
}

module "frontend" {
  source = "./frontend"
  # Global variables

  region       = var.region
  project_name = var.project_name
  environment  = var.environment
}

module "networking" {
  source = "./networking"

  # Global variables
  region       = var.region
  project_name = var.project_name
  environment  = var.environment

  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr

}