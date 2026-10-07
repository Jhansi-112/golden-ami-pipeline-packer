# Golden AMI Pipeline with HashiCorp Packer

Builds a hardened, pre-configured Ubuntu 22.04 AWS AMI using Packer.

## What this project does
- Finds the latest Ubuntu 22.04 base image with a source filter
- Installs updates and nginx with shell provisioners
- Applies basic SSH hardening (root login off, password login off)
- Uses variable files for dev and QA

## Tools
Packer, AWS (EC2, AMI, IAM), Linux, Git, GitHub, VS Code

## Credit
Learned in a hands-on DevOps training course. The practice labs are based on public HashiCorp Packer tutorials. The implementation and changes in this repo are my own.
