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

variable "network_bridge" {
  description = "Bridge to attach the container's network interface to. Defaults to SDN bridge 'vnet1'."
  type        = string
  default     = "vnet1"
}

variable "ipv4_address" {
  description = "Static IPv4 address for the container in CIDR notation (e.g. 192.168.1.101/24)"
  type        = string
  default     = "dhcp"
}

variable "ipv4_gateway" {
  description = "Default gateway for the container"
  type        = string
  default     = null
}

variable "ssh_public_key" {
  description = "SSH public key to inject into the container for access"
  type        = string
  sensitive   = true
}