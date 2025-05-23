# environment variables
region       = "us-east-1"
project_name = "pocblog"
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
secrets_manager_secret_name = "pocblog-secrets"

# rds variables
multi_az_deployment          = "false" # we are not creating a standby rds because of the extra cost
database_instance_identifier = "app-db"
database_instance_class      = "db.t4g.micro"
publicly_accessible          = "false"
kms_key_id                   = "arn:aws:kms:us-east-1:880616236833:key/3aac93d8-6a3f-4165-a08d-c78a23ce12cb"

# s3 variables
env_file_bucket_name = "pocblog-app-env-file-bucket"
env_file_name        = "env-variables-file.env"

# ecs variables
architecture = "X86_64"
image_name   = "pocblog-app"
image_tag    = "latest"
