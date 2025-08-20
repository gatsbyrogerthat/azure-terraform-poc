# Generate random suffix for unique naming
#resource "random_integer" "suffix" {
 # min = 1000
  #max = 9999
#}

# Resource Group
data "azurerm_resource_group" "main" {
  name     = "aztfgh_poc_rg"
  #location = var.location

  tags = {
    environment = var.environment
    project     = "terraform-poc"
    created-by  = "terraform"
  }
}

# Storage Account for website
resource "azurerm_storage_account" "website" {
  name                     = "aztfghpoc1"
  resource_group_name      = data_resource_group.main.name
  location                 = data_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  static_website {
    index_document = "index.html"
  }

  tags = {
    environment = var.environment
    project     = "terraform-poc"
    created-by  = "terraform"
  }
}

# Upload website files
resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web1"
  type                   = "Block"
  source                 = "${path.module}/../web/index.html"
  content_type          = "text/html"
}

resource "azurerm_storage_blob" "style" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.website.name
  storage_container_name = "$web1"
  type                   = "Block"
  source                 = "${path.module}/../web/style.css"
  content_type          = "text/css"
}