provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "iac-demo-rg"
  location = "Australia East"
}

resource "azurerm_service_plan" "example" {
  name                = "iac-demo-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "iac-demo-webapp12345"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}
