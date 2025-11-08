variable "vm_name" {}
variable "node" {}
variable "template" {}
variable "cores" { default = 2 }
variable "memory" { default = 2048 }
variable "disk_size" { default = "10G" }
variable "bridge" { default = "vmbr0" }
variable "ssh_keys" { default = "" }
variable "storage" {
  description = "Proxmox storage to use for the VM disk"
  type        = string
  default     = "local-lvm"  # replace with your Proxmox storage name
}

