## Project Layout
terraform-project/
│
├── modules/                         # Reusable infrastructure components
│   ├── vpc/                         # Example: VPC module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── ec2/
│   ├── rds/
│   └── ...                          # Other logical infra components
│
├── envs/                            # Environment-specific configurations
│   ├── dev/
│   │   ├── main.tf
│   │   ├── backend.tf              # Remote state backend config
│   │   ├── provider.tf             # Environment-specific provider settings
│   │   ├── variables.tf            # Environment-specific variables
│   │   └── terraform.tfvars        # Input variable values
│   ├── staging/
│   └── prod/
│
├── globals/                         # Global/shared configurations (optional)
│   ├── providers.tf
│   ├── backend.tf
│   └── common_variables.tf
│
├── scripts/                         # Helper scripts (e.g. init, plan, apply)
│
├── .terraform.lock.hcl
├── versions.tf                      # Terraform and provider versions
└── README.md

