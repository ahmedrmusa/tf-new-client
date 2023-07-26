#!/bin/bash

# Function to read user input
function read_input {
  if [ "$1" == "RDS DB Password" ]; then
    read -sp "$1: " var
    echo
  else
    read -p "$1: " var
  fi
  echo "$var"
}

# Check if Terraform is installed
if ! [ -x "$(command -v terraform)" ]; then
  echo "Error: Terraform is not installed. Please install Terraform first."
  echo "More info: https://www.terraform.io/downloads.html"
  exit 1
fi

# Check if AWS CLI is configured
if ! [ -x "$(command -v aws)" ]; then
  echo "Error: AWS CLI is not installed. Please install AWS CLI and configure it with proper credentials."
  echo "More info: https://aws.amazon.com/cli/"
  exit 1
fi

# Ask the user for the client's name
client_name=$(read_input "Client Name")

# New Client Onboarding
client_path="./environments/$client_name"

# Create a new folder for the client
mkdir -p $client_path

# Generate the client-specific variables file (client.tfvars)
cat > "$client_path/client.tfvars" << EOL
vpc_id = "$(read_input "VPC ID")"
subnet_id = "$(read_input "Subnet ID")"
instance_type = "$(read_input "EC2 Instance Type")"
ami_id = "$(read_input "AMI ID")"
key_name = "$(read_input "Key Pair Name")"
allocated_storage = "$(read_input "RDS Allocated Storage")"
instance_class = "$(read_input "RDS Instance Class")"
db_name = "$(read_input "RDS DB Name")"
username = "$(read_input "RDS DB User")"
password = "$(read_input "RDS DB Password")"
EOL

# Change to the client's directory
cd $client_path

# Run Terraform commands
terraform init ../../
terraform apply -var-file=client.tfvars -auto-approve ../../

# Print completion message
echo "Infrastructure deployment completed for client: $client_name."
echo "For more info go to : $client_path/README.md."
