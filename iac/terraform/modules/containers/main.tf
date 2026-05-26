terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

resource "proxmox_virtual_environment_container" "this" {
  vm_id        = var.vm_id
  node_name    = var.node_name
  unprivileged = var.unprivileged

  initialization {
    hostname = var.hostname

    dns {
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      keys = [var.ssh_public_key]
    }
  }

  dynamic "features" {
    for_each = var.nesting || var.keyctl ? [1] : []
    content {
      nesting = var.nesting
      keyctl  = var.keyctl
    }
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.disk_datastore
    size         = var.disk_size
  }

  network_interface {
    name   = "eth0"
    bridge = var.network_bridge
  }

  operating_system {
    template_file_id = var.template_file_id
    type             = "ubuntu"
  }

  wait_for_ip {
    ipv4 = true
  }
}
