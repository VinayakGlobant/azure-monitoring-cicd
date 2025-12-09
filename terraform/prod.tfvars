location              = "westeurope"
rg_name               = "rg-monitoring-prod"

workbook_display_name = "External Service Health - Prod"
workbook_source_id    = "/subscriptions/<subId>/resourceGroups/rg-monitoring-prod/providers/microsoft.insights/components/appi-monitoring-prod"
workbook_file_path    = "../workbooks/external_service_health.workbook.json"

dashboard_name        = "monitoring-dashboard-prod"
dashboard_file_path   = "../dashboards/monitoring-dashboard.json"
