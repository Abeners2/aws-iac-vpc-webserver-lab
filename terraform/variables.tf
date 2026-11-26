variable "aws_region" {
  description = "AWS region for deploying the lab infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for naming and tagging resources"
  type        = string
  default     = "aws-iac-web-lab"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the custom VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet (web tier)"
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet (isolated tier)"
  type        = string
  default     = "10.20.2.0/24"
}

variable "allowed_ssh_cidr" {
  description = "Your workstation public IP in CIDR notation (e.g., 203.0.113.10/32). Never use 0.0.0.0/0 in production."
  type        = string
  default     = "198.51.100.10/32"
}

variable "instance_type" {
  description = "EC2 instance type (Free Tier eligible: t3.micro or t2.micro)"
  type        = string
  default     = "t3.micro"
}
