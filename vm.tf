terraform {
  required_version = "1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.74"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Random block
resource "random_string" "myrandom" {
  length  = 4
  special = false
  upper   = false

}

# Resource group
resource "azurerm_resource_group" "myrg" {
  name     = "myrg"
  location = "eastus"
}

# Virtual network
resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.vnet-address
}

# Virtul networksubnet
resource "azurerm_subnet" "sn1" {
  name                 = var.subnet
  virtual_network_name = azurerm_virtual_network.myvnet.name
  resource_group_name  = azurerm_resource_group.myrg.name
  address_prefixes     = var.subnet-add-space
}

# NSG
resource "azurerm_network_security_group" "mynsg" {
  name                = var.nsg
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# subnet and nsg association
resource "azurerm_subnet_network_security_group_association" "nsg1-work" {
  network_security_group_id = azurerm_network_security_group.mynsg.id
  subnet_id                 = azurerm_subnet.sn1.id
}
