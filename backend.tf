terraform {
  backend "azurerm" {
    resource_group_name = "terraform-rg-${random_string.myrandom.id}"
    storage_account_name = "ethanssa"
    container_name = "mycontainer"
    key = "terraform.tfstate"
  }
}
