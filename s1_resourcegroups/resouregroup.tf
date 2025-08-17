# web app resource group
resource "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}-${local.resource_name_prefix}" # rg-web-app-eastus
  location = var.resource_group_location
  tags = local.common_tags
}

# We need the tenant id for the key vault.
data "azurerm_client_config" "this" {}

# This allows us to randomize the region for the resource group.
# module "regions" {
#   source  = "Azure/avm-utl-regions/azurerm"
#   version = "0.3.0"
# }

# This allows us to randomize the region for the resource group.
# resource "random_integer" "region_index" {
#   max = length(module.regions.regions) - 1
#   min = 0
# }

# This ensures we have unique CAF compliant names for our resources.
# module "naming" {
#   source  = "Azure/naming/azurerm"
#   version = "0.3.0"
# }

# # This is required for resource modules
# resource "azurerm_resource_group" "this" {
#   location = module.regions.regions[random_integer.region_index.result].name
#   name     = module.naming.resource_group.name_unique
# }

# This is the module call
module "keyvault" {
  # source = "../../"

  location = var.resource_group_location
  source              = "Azure/avm-res-keyvault-vault/azurerm"
  name                = "${var.resource_group_name}-kv-${local.resource_name_prefix}" # kv-web-app-eastus
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.this.tenant_id
  enable_telemetry    = false
}