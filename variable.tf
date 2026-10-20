variable "environment" {
  type        = string
  description = "The environment for which to deploy resources"
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "The environment variable must be one of 'dev', 'test', or 'prod'."
  }
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed"
  validation {
    condition     = contains(["East US", "West Europe", "India South Central"], var.location)
    error_message = "The location variable must be one of 'East US', 'West Europe', or 'India South Central'."
  }
}

variable "name_prefix" {
  type        = string
  description = "A prefix to be used for naming resources"

}

variable "instance_count" {
  type        = number
  description = "The number of instances to create"
  default     = 2
  validation {
    condition     = var.instance_count > 1 && var.instance_count <= 5
    error_message = "The instance_count variable must be between 2 and 5."
  }
}

variable "min_instance_count" {
  type        = number
  description = "The minimum number of instances to create"
  default     = 2

}

variable "max_instance_count" {
  type        = number
  description = "The maximum number of instances to create"
  default     = 5
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the virtual network"
}

variable "app_subnet_prefixes" {
  type        = list(string)
  description = "The address prefixes for the subnets"
}

variable "management_subnet_prefixes" {
  type        = list(string)
  description = "The address prefixes for the management subnets"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the virtual machines"
  default     = "azureadmin"
}

variable "ssh_public_key_path" {
  type        = string
  description = "The SSH public key for the virtual machines"
}