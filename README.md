# AWS Terraform Environment-Split Infrastructure

## 🌍 Overview

This project extends the `aws-terraform-bootstrap` project by introducing:

- Remote state management using AWS S3.
- Support for multiple environments (`dev`, `staging`) with isolated state.
- A reusable S3 module as an infrastructure example.

## 📂 Structure

```bash
modules/           # Reusable modules
envs/              # Environment-specific configurations
  ├── dev/         # Dev environment setup
  └── staging/     # Staging environment setup

