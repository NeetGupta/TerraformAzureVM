variable "resource_group_name" {
    description = "this is resource group name"
    type = string
    default = "Terraform"
  
}
variable "resource_group_location" {
  description = "this is resource group location"
  type = string
  default = "West Europe"
}
variable "subnet_address_prefix" {
  description = "azure vm subnet name"
  type = string
  default = "10.0.2.0/24"
}
variable "virtual_network_name" {
  description = "name of the virtual network"
  default = "Terraform"
  type = string
}
variable "virtual_address_space" {
  default = "10.0.0.0/16"
  type = string
  description = "virtual addtess"
}
variable "subnet_name" {
  default = "Terraform"
   type = string
   description = "subnet name"
}
variable "nic_name" {
  description = "virtual network name"
  type = string
  default = "Terraform"
}
variable "vm_name" {
  default = "Terraform"
  description = "virtual machine name"
  type = string
}
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
  default     = "P@$$w0rd1234!"  # ⚠️ For real projects, override this securely!
}
