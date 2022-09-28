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
