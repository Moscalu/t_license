# Documentation of the provider used

## URL link for the official documentation of the provider

### Focused on
- https://registry.terraform.io/providers/bpg/proxmox/latest/docs

### Discarded
- https://registry.terraform.io/providers/Telmate/proxmox/latest/docs?ref=tcude.net

## Proxmox version used against current provider
- PVE 8.4.19

## Requirements before upgrading to the next major version of PVE

### Telmate Requirements
- In Proxmox 9, the VM.Monitor privilege was deprecated and is no longer required.
- If you need to adjust the role's permissions later, you can use the pveum role modify command. Simply add or remove privileges from the -privs list as needed. For example if you are migrating from Proxmox 8 to 9, you may run the following command to remove VM.Monitor