provider "aws" {
  region = "us-east-1"
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
