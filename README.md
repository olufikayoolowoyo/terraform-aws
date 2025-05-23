# AWS Terraform Environment-Split Infrastructure

## 🌍 Overview

This project extends the `aws-terraform-bootstrap` project by introducing:

- Remote state management using AWS S3.
- Support for multiple environments (`dev`, `staging`) with isolated state.
- A reusable S3 module as an infrastructure example.

## 📂 Structure

```bash
modules/           # Reusable modules
  |── s3           # S3 Bucket
  |── vpc          # VPC Module
envs/              # Environment-specific configurations
  ├── dev/         # Dev environment setup
  └── staging/     # Staging environment setup
  
## ☁️ Features

- Environment-tagged VPCs
- Subnet splitting for high availability
- Outputs for downstream usage (e.g., ECS, RDS)

## 🏗️ Deploy

```bash
cd envs/dev
terraform init -backend-config="backend.tfvars"
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"



