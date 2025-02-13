# environment variables
region       = "us-east-1"
project_name = "uniandes"
environment  = "dev"

# vpc variables
vpc_cidr                     = "10.0.0.0/16"
public_subnet_az1_cidr       = "10.0.0.0/24"
public_subnet_az2_cidr       = "10.0.1.0/24"
private_app_subnet_az1_cidr  = "10.0.2.0/24"
private_app_subnet_az2_cidr  = "10.0.3.0/24"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az2_cidr = "10.0.5.0/24"

# secrets manager variables
secrets_manager_secret_name = "uniandes-secrets"

# rds variables
multi_az_deployment          = "false" # we are not creating a standby rds because of the extra cost
database_instance_identifier = "app-db"
database_instance_class      = "db.t4g.micro"
publicly_accessible          = "false"

# s3 variables
env_file_bucket_name = "uniandes-app-env-file-bucket"
env_file_name        = "env-variables-file.env"

# ecs variables
architecture = "X86_64"
image_name   = "uniandes-app"
image_tag    = "latest"
