/* terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">=1"
}

# website::tag::1:: The simplest possible Terraform module: it just outputs "Hello, World!"
output "hello_world" {
  value = "Rahul is testing!"
} */


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "ami" {
  default     = "ami-00831fc7c1e3ddc60"
  description = "Amazon Machine Image ID for Ubuntu Server 20.04"
}

variable "type" {
  default     = "t2.micro"
  description = "Size of VM"
}


resource "aws_instance" "demo" {
  ami           = var.ami
  instance_type = var.type

  tags = {
    name = "Demo System"
  }
}

output "instance_id" {
  instance = aws_instance.demo.id
}
