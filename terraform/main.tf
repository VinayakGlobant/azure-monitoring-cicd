# Data sources: read JSON files
data "local_file" "workbook_json" {
  filename = var.workbook_file_path
}

data "local_file" "dashboard_json" {
  filename = var.dashboard_file_path
}

# (Optional) Use a data source if RG pre-exists; otherwise, create it.
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

# Azure Workbook
resource "azurerm_application_insights_workbook" "workbook" {
  name                = lower(replace(var.workbook_display_name, " ", "-"))
  display_name        = var.workbook_display_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  source_id           = var.workbook_source_id

  # App Insights or Log Analytics resource id
  data_json = data.local_file.workbook_json.content
}

# Azure Portal Dashboard
resource "azurerm_portal_dashboard" "dashboard" {
  name                = var.dashboard_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  dashboard_properties = data.local_file.dashboard_json.content
}

# Outputs
output "workbook_id" {
  value       = azurerm_application_insights_workbook.workbook.id
  description = "ID of the deployed workbook."
}

output "dashboard_id" {
  value       = azurerm_portal_dashboard.dashboard.id
  description = "ID of the deployed dashboard."
}
