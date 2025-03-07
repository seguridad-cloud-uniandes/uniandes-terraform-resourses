provider "aws" {
  region = "us-east-1"


  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

terraform {
  required_version = ">=1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=1.4.0"
    }
  }
}
