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

# ─── ACCESS ───────────────────────────────────────────────────────────────────

variable "ssh_public_key" {
  description = "SSH public key to inject into containers for root access"
  type        = string
  sensitive   = true
}
