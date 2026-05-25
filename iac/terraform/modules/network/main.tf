data "proxmox_virtual_environment_network_linux_bridge" "sdn" {
  node_name = var.node_name
  name      = var.bridge_name
}