packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ubuntu-nginx-{{timestamp}}"
  instance_type = "t3.micro"
  region        = "ap-south-1"
  ami_regions   = ["ap-southeast-1"]

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = "ubuntu"

  tags = {
    Name       = "packer-ubuntu-nginx"
    Created-by = "Packer"
    Lab        = "lab02"
  }
}

build {
  name    = "learn-packer"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = [
      "cloud-init status --wait || true",
      "echo Installing updates",
      "sudo apt-get update -y",
      "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx",
      "nginx -v",
      "sudo apt-get clean"
    ]
  }
}