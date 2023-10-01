terraform {
  backend "azurerm" {
    resource_group_name = "myrg"
    storage_account_name = "ethanssa"
    container_name = "mycontainer"
    key = "terraform.tfstate"
  }
}
