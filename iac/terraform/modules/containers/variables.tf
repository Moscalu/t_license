variable "vm_id" {
  description = "Unique numeric ID for the Proxmox container (e.g. 101)"
  type        = number
}

variable "node_name" {
  description = "Name of the Proxmox node where the container will be created"
  type        = string
}

variable "hostname" {
  description = "Hostname for the Proxmox container"
  type        = string
}

variable "cores" {
  description = "Number of vCPU cores allocated to the container"
  type        = number
  default     = 1
}

variable "memory" {
  description = "RAM allocated to the container in megabytes"
  type        = number
  default     = 256
}

variable "disk_size" {
  description = "Disk size allocated to the container in gigabytes"
  type        = number
  default     = 4
}

variable "disk_datastore" {
  description = "Proxmox storage pool where the container disk will be created (e.g. local, local-lvm)"
  type        = string
  default     = "local-lvm"
}

variable "template_file_id" {
  description = "Full Proxmox template ID (e.g. local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst)"
  type        = string
}

variable "network_bridge" {
  description = "Bridge to attach the container network interface to"
  type        = string
  default     = "vnet1"
}

variable "ipv4_address" {
  description = "Static IPv4 address in CIDR notation, or 'dhcp'"
  type        = string
  default     = "dhcp"
}

variable "ipv4_gateway" {
  description = "Default gateway for the container"
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "List of DNS servers for the container"
  type        = list(string)
  default     = ["1.1.1.1", "8.8.8.8"]
}

variable "unprivileged" {
  description = "Run container as unprivileged — required for feature flags with non-root@pam tokens"
  type        = bool
  default     = true
}

variable "nesting" {
  description = "Enable nested containers — required for Docker inside LXC"
  type        = bool
  default     = false
}

variable "keyctl" {
  description = "Enable keyctl() syscall — required by some GitLab Runner operations"
  type        = bool
  default     = false
}

variable "ssh_public_key" {
  description = "SSH public key to inject into the container for root access"
  type        = string
  sensitive   = true
}
