resource "proxmox_virtual_environment_container" "this" {
  vm_id     = var.vm_id
  node_name = var.node_name

  initialization {
    hostname = var.hostname

    user_account {
      keys = [file(var.ssh_public_key)]
    }
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id  = "local-lvm"
    size          = var.disk_size
  }

  network_interface {
    name    = "eth0"
    bridge  = var.network_bridge
  }

  operating_system {
    template_file_id  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
    type              = ubuntu
  }
}