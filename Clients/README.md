# Onboarding New Clients
Leveraging a shell script `./run.sh` to onboard new client's. This creates a new client folder based on passed in `client_name`, generates it's `client.tfvars` file based on admin input and deploys the required infrastructure.

## Requirements
- Terraform v1.1+ [installed locally](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- An AWS account with local credentials [configured for use with Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication).
- Include Custom user_data script in `./modules/ec2/user_data/${client_name}.`sh/ps1 for ec2 instance.

## Steps to run
Enable script to execute & initiate interrative mode on your terminal:
```
chmod u+x run.sh && ./run.sh
```

## Alternatively
See Example : [musa.nyc/client.tfvars](./list/musa.nyc/client.tfvars) to input required variables and deploy without `run.sh`.