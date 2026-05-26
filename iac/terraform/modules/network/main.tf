terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.107.0"
    }
  }
}

data "proxmox_virtual_environment_network_linux_bridge" "sdn" {
  node_name = var.node_name
  name      = var.bridge_name
}

