terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # Change the key if you want to use a different state file.
  backend "s3" {
    bucket         = "terraform-state-eu-west-2-320501085695"
    key            = "datalake/zeki_patents/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-locks"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}