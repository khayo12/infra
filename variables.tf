variable "aws_cli_usr_access_key" {
  type    = string
  default = "AKIAYWEJ6XF4AUDS45ZQ"
}
variable "aws_cli_usr_secret_key" {
  type    = string
  default = "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"
}
variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "tags" {
  type        = map(string)
  description = "mapping of tags to assign to the instance"
  default = {
    terraform = "true"
    Name      = "application-instance"
  }
}
variable "key_name" {
  type        = string
  description = "ssh key to connect to instance"
  default     = "website"
}
variable "instance_type" {
  type        = string
  description = "instance type for the instance"
  default     = "t2.micro"
}
variable "ami_id" {
  type        = string
  description = "os image id for the instance."
  default     = "ami-0dfcb1ef8550277af"
}
variable "subnet_id" {
  type        = string
  description = "subnet id to launch the instance in"
  default     = "subnet-0794918d5449df64b"
}
variable "vpc_id" {
  type        = string
  description = "vpc"
  default     = "vpc-0ebd16348612ec7c8"
}
variable "availability_zone" {
  type        = string
  description = "az to start the instance in"
  default     = "us-east-1c"
}