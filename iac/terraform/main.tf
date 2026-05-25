terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.107.0"
    }
  }
}

provider "proxmox" {
  endpoint    = var.proxmox_endpoint
  api_token   = var.proxmox_api_token
  insecure    = var.proxmox_insecure
}

data "proxmox_virtual_environment_nodes" "nodes" {}
data "proxmox_virtual_environment_vms" "all" {
  node_name = var.proxmox_node #"prod-pve-1"
}
data "proxmox_virtual_environment_containers" "all" {
  for_each = toset(local.nodes.names)
  node_name = each.value
}
data "proxmox_sdn_vnet" "vnet1" {
  id = "vnet1"
}

locals {
  nodes     = data.proxmox_virtual_environment_nodes.nodes
  ct_list   = flatten([
    for node in data.proxmox_virtual_environment_containers.all : node.containers
  ])
  ct_map    = { for ct in local.ct_list : ct.vm_id => ct }  # Set vm_id as a unique key for easy lookup
  ct_names  = local.ct_list[*].name
}

output "pve_vms" {
  value = data.proxmox_virtual_environment_vms.all.vms
}

output "pve_container_names" {
  value = {
    #names = local.ct_list[*].name   # The same as: [for ct in local.ct_list : ct.name]
    #count = length(local.ct_list)
    ct_map = local.ct_map["9101"] #local.ct_map
  }
}

output "pve_snd_vnet" {
  value = data.proxmox_sdn_vnet.vnet1
}