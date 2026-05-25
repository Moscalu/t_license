# ─── PROXMOX CONNECTION ───────────────────────────────────────────────────────

variable "proxmox_endpoint" {
  description = "URL of the Proxmox API endpoint (e.g. https://192.168.1.10:8006/api2/json)"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token in format: <user>@<realm>!<token-name>=<uuid>"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Skip TLS certificate verification (set true for self-signed certs)"
  type        = bool
  default     = true
}

# ─── PROXMOX NODE ─────────────────────────────────────────────────────────────

variable "proxmox_node" {
  description = "Name of the Proxmox node where resources will be created"
  type        = string
}

# ─── LXC — GITLAB SERVER ──────────────────────────────────────────────────────

variable "gitlab_ct_id" {
  description = "Unique numeric ID for the GitLab container in Proxmox (100–999999)"
  type        = number
}

variable "gitlab_ct_name" {
  description = "Hostname for the GitLab container"
  type        = string
  default     = "gitlab-server"
}

variable "gitlab_ct_template" {
  description = "Name of the LXC template to use (must exist on the node)"
  type        = string
}

variable "gitlab_ct_cores" {
  description = "Number of vCPU cores allocated to the GitLab container"
  type        = number
  default     = 2
}

variable "gitlab_ct_memory" {
  description = "RAM allocated to the GitLab container in megabytes"
  type        = number
  default     = 4096
}

variable "gitlab_ct_disk_size" {
  description = "Root disk size for the GitLab container (e.g. '60G')"
  type        = string
  default     = "60G"
}

variable "gitlab_ct_storage" {
  description = "Proxmox storage pool where the container disk will be created"
  type        = string
  default     = "local"
}

# ─── NETWORK ──────────────────────────────────────────────────────────────────

variable "gitlab_vm_ip" {
  description = "Static IP address for the GitLab container in CIDR notation (e.g. 192.168.1.101/24)"
  type        = string
}

variable "gitlab_vm_gateway" {
  description = "Default gateway for the GitLab container"
  type        = string
}

variable "gitlab_vm_dns" {
  description = "DNS server for the GitLab container"
  type        = string
  default     = "1.1.1.1"
}

variable "gitlab_vm_bridge" {
  description = "Proxmox Linux bridge to attach the container network interface to"
  type        = string
  default     = "vmbr0"
}

# ─── ACCESS ───────────────────────────────────────────────────────────────────

variable "gitlab_vm_user" {
  description = "Default OS user created inside the container"
  type        = string
  default     = "ubuntu"
}

variable "gitlab_vm_ssh_public_key" {
  description = "SSH public key injected into the container for the default user"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key to inject into the container for access"
  type        = string
  sensitive   = true
}