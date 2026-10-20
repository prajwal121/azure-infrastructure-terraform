\# Azure Infrastructure Automation with Terraform



\## Project Overview



This project provisions Azure infrastructure using Terraform, including a Linux Virtual Machine Scale Set (VMSS), a public Azure Load Balancer, virtual networking, and CPU-based autoscaling.



The VM instances automatically install Apache and host a sample website using a startup script.



\## Architecture



Traffic flows through these components:



1\. Azure Public IP and DNS

2\. Azure Standard Load Balancer

3\. HTTP health probe and load-balancing rule

4\. Linux Virtual Machine Scale Set running Ubuntu

5\. Apache web server hosting a sample webpage



\## Features



\- Infrastructure as Code using Terraform

\- Azure Resource Group and Virtual Network

\- Separate application and management subnets

\- Network Security Group with inbound traffic rules

\- Ubuntu Linux Virtual Machine Scale Set

\- Standard Azure Load Balancer with HTTP health probe

\- Apache installation through a startup script

\- CPU-based autoscaling configuration

\- Resource naming conventions and common tags



\## Technologies Used



\- Microsoft Azure

\- Terraform

\- Azure Virtual Machines and VM Scale Sets

\- Azure Load Balancer

\- Azure Virtual Network and Network Security Groups

\- Azure Monitor autoscaling

\- Ubuntu Linux

\- Apache HTTP Server

\- Bash



\## Repository Structure



\- `provider.tf` — Terraform and Azure provider configuration

\- `backend.tf` — Azure Storage backend configuration

\- `variable.tf` — Input variable definitions

\- `locals.tf` — Resource naming, VM sizes, and common tags

\- `vnet.tf` — Resource group, virtual network, subnets, and network security rules

\- `vmss.tf` — Linux Virtual Machine Scale Set configuration

\- `loadbalancer.tf` — Public IP, load balancer, backend pool, and health probe

\- `autoscale.tf` — CPU-based autoscaling rules

\- `user-data.sh` — Startup script to install Apache and create the sample webpage

\- `.terraform.lock.hcl` — Provider dependency lock file

\- `.gitignore` — Files excluded from Git tracking



\## Prerequisites



\- An Azure subscription

\- Terraform installed

\- Azure CLI installed and authenticated

\- An SSH key pair

\- Permissions to create the required Azure resources



\## Deployment



1\. Authenticate to Azure using the Azure CLI:



&#x20;  `az login`



2\. Initialize Terraform:



&#x20;  `terraform init`



3\. Review the planned changes:



&#x20;  `terraform plan -var-file="terraform.tfvars"`



4\. Apply the configuration:



&#x20;  `terraform apply -var-file="terraform.tfvars"`



The `terraform.tfvars` file and SSH key paths must be configured locally. Do not commit credentials, private keys, Terraform state files, or plan files.



\## Autoscaling Configuration



The project defines CPU-based scaling rules:



\- Scale out by one instance when average CPU exceeds 80%.

\- Scale in by one instance when average CPU drops below 10%.

\- Configured minimum capacity: 2 instances.

\- Configured maximum capacity: 5 instances.



These rules are configured in Terraform; actual scaling events should be tested separately.



\## Cleanup



To remove the infrastructure created by Terraform, review the resources and run:



`terraform destroy -var-file="terraform.tfvars"`



\*\*Warning:\*\* This deletes managed infrastructure. Confirm that you want to remove the resources before proceeding.



\## Disclaimer



This is a hands-on learning project demonstrating Azure infrastructure automation with Terraform. Review networking, authentication, and security settings before adapting it for production workloads.



