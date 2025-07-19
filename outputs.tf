output "resource_group_name" {
  value = azurerm_resource_group.Terraform.name
}
output "virtual_network_name" {
  value = azurerm_virtual_network.Terraform.name
}
output "subnet_id" {
  value = azurerm_subnet.Terraform.id
}

output "nic_id" {
  value = azurerm_virtual_network.Terraform.id
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.Terraform.id
}
