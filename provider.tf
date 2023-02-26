provider "aws" {
  region = var.aws_region
  access_key = var.aws_cli_usr_access_key
  secret_key = var.aws_cli_usr_secret_key
}