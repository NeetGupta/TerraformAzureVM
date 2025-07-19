terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # or whatever version you're targeting
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}
resource "azurerm_resource_group" "Terraform" {
  name = var.resource_group_name
  location = var.resource_group_location
}



resource "azurerm_virtual_network" "Terraform" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.Terraform.location
  resource_group_name = azurerm_resource_group.Terraform.name
  address_space       = [var.virtual_address_space]
}
  resource "azurerm_subnet" "Terraform" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.Terraform.name
  virtual_network_name = azurerm_virtual_network.Terraform.name
  address_prefixes = [var.subnet_address_prefix]
  }
resource "azurerm_network_interface" "Terraform" {
  name                = var.nic_name
  location            = azurerm_resource_group.Terraform.location
  resource_group_name = azurerm_resource_group.Terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Terraform.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "Terraform" {
  name = var.vm_name
  location = azurerm_resource_group.Terraform.location
  resource_group_name = azurerm_resource_group.Terraform.name
size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.Terraform.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

  

