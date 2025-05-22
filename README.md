# AWS Terraform Bootstrap Project

## 🚀 Project Overview

This is the foundational project for a series of Terraform-based AWS infrastructure deployments. It provisions a single AWS S3 bucket using a modular structure and sets up a scalable directory layout for future multi-environment use.

## 🧱 Structure

```bash
.
├── modules/          # Reusable Terraform modules
│   └── s3/           # Basic S3 module
├── envs/             # Environment-specific configs
│   └── dev/          # Dev environment for initial testing
