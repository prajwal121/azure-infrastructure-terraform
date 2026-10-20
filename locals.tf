locals {
  vm_sizes = {
    dev   = "Standard_B1s"
    stage = "Standard_B2s"
    prod  = "Standard_B2ms"
  }

  vm_size = lookup(local.vm_sizes, var.environment, "Standard_B1s")

  resource_prefix = "${var.name_prefix}-${var.environment}"

  common_tags = {
    Environment = var.environment
    Project     = "MiniProject-1"
    ManagedBy   = "Terraform"
  }

  vnet_name              = "${local.resource_prefix}-vnet"
  app_subnet_name        = "${local.resource_prefix}-app-subnet"
  management_subnet_name = "${local.resource_prefix}-management-subnet"
  nsg_name               = "${local.resource_prefix}-nsg"
}