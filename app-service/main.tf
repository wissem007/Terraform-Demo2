provider "azurerm" {
   features {}
}
resource "azurerm_resource_group" "wissem" {
  name     = "wissem-resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "wissem" {
  name                = "wissem"
  resource_group_name = azurerm_resource_group.wissem.name
  location            = azurerm_resource_group.wissem.location
  os_type             = "Linux"
  sku_name            = "DS1_v2"
}

resource "azurerm_linux_web_app" "wissem" {
  name                = "wissem"
  resource_group_name = azurerm_resource_group.wissem.name
  location            = azurerm_service_plan.wissem.location
  service_plan_id     = azurerm_service_plan.wissem.id

  site_config {}
}
