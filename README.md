# my-empty-tf-infra

Terraform project scaffold with modular structure and separate environments.

## Layout

- \modules/\: Reusable infrastructure modules (placeholders)
- \envs/\: Environment-specific configurations
- \globals/\: Shared provider/backend config (optional)
- \scripts/\: Helper scripts (init/apply/etc.)

## Next Steps

- Implement resources inside \modules/\
- Configure your remote state backend (e.g. create the S3 bucket and DynamoDB table)
- Fill in environment-specific configurations
