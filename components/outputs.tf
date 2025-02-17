### outputs needed to create ecr repository
# export the image name
output "image_name" {
  description = "The name of the Docker image."
  value       = var.image_name
}

# rds endpoint
output "rds_endpoint" {
  description = "The endpoint of the RDS database instance."
  value       = aws_db_instance.database_instance.endpoint
}

# export the image tag
output "image_tag" {
  description = "The tag of the Docker image."
  value       = var.image_tag
}

### outputs needed to create self-hosted aws ec2 runner
# private data subnet az1 id
output "private_data_subnet_az1_id" {
  description = "The ID of the private data subnet in availability zone 1."
  value       = aws_subnet.private_data_subnet_az1.id
}

# runner security group id
output "runner_security_group_id" {
  description = "The ID of the security group for the self-hosted AWS EC2 runner."
  value       = aws_security_group.runner_security_group.id
}

### outputs needed to create a new revision for the ecs task definition
# task definition name
output "task_definition_name" {
  description = "The name of the ECS task definition."
  value       = "${var.project_name}-${var.environment}-td"
}

### outputs needed to restart the ecs service
# ecs cluster name
output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = "${var.project_name}-${var.environment}-cluster"
}

# ecs service name
output "ecs_service_name" {
  description = "The name of the ECS service."
  value       = "${var.project_name}-${var.environment}-service"
}

### outputs needed to build environment file
# environment file name
output "environment_file_name" {
  description = "The name of the environment file."
  value       = var.env_file_name
}

# s3 bucket name
output "env_file_bucket_name" {
  description = "The name of the S3 bucket where the environment file is stored."
  value       = aws_s3_bucket.env_file_bucket.id
}
