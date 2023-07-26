# Terraform Modules for new SaaS Client

## Task:
Deploy a new microservice in a SaaS environment - this will provide a new API endpoint to the SaaS clients. We want to write Terraform module(s) to deploy the infrastructure required to host this service.
Note there can be many separate environments (some specific to a single client), and we want this module to be created in a way we can reuse it to easily deploy the new service in all environments.

Write Terraform modules to create this infrastructure, meeting the below requirements. Make the code clear and maintainable. This will be deployed on AWS and you should use the AWS Terraform provider.

## Requirements:
- The resources for this service should go into an existing VPC/subnet
- The service itself runs on Windows and should run on a Windows EC2 instance
- The instance needs to take a user data powershell script that will perform some setup tasks (you do not need to write the powershell script, but there should be a placeholder for the full script)
- The application running on the instance listens on ports 443 and 7000-7010
- There should be an RDS instance that will be used for the DB backend (use MSSQL Server)
- The application should be behind an Application Load Balancer with appropriate ports exposed
- Security groups should be created that allow the minimal required level of access between systems. The service should not be accessible over the internet.
- There should be a VPC endpoint service created to expose this service to clients

# Implementation
The `modules/` directory contains folders for each resource modules and their respective `main.tf`, `variables.tf` & `outputs.tf`.

The `Clients/` directory maintains a `./list` of clients deployed and a `run.sh` for an interactive experience for admins. The following infrastructure components will be created:

- EC2 instance to host the application.
- RDS instance for the database backend.
- Application Load Balancer (ALB) for load balancing.
- Security Groups for securing the resources.
- VPC Endpoint Service for exposing the service to clients.

### [More info here.](./Clients/README.md)
