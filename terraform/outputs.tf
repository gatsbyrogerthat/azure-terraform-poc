output "website_url" {
  description = "URL of your website"
  value       = azurerm_storage_account.website.primary_web_endpoint
}

#output "resource_group_name" {
 # description = "Name of the resource group"
  #value       = azurerm_resource_group.main.name
#}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.website.name
}