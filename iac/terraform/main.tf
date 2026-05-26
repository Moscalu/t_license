terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.107.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure
}

module "test01" {
  source           = "./modules/containers"
  vm_id            = 301
  node_name        = var.proxmox_node
  hostname         = "test01"
  ssh_public_key   = var.ssh_public_key
  ipv4_address     = "10.10.1.201/24"
  ipv4_gateway     = "10.10.1.32"
  disk_datastore   = "local"
  template_file_id = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}
