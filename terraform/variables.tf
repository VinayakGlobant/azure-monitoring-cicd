variable "location" {
  type        = string
  description = "Azure region for resources."
}

variable "rg_name" {
  type        = string
  description = "Target resource group name."
}

variable "workbook_display_name" {
  type        = string
  description = "Display name of the Azure Workbook."
}

variable "workbook_source_id" {
  type        = string
  description = "Resource ID for the data source (App Insights or Log Analytics)."
}

variable "workbook_file_path" {
  type        = string
  description = "Relative path to the workbook JSON file."
}

variable "dashboard_name" {
  type        = string
  description = "Name of the Azure Portal Dashboard resource."
}

variable "dashboard_file_path" {
  type        = string
  description = "Relative path to the dashboard JSON file."
}
