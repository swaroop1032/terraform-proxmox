terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.31.180:8006/api2/json"  # replace with your Proxmox IP
  pm_user         = "terraform@pam!tf-token"
  pm_password     = "2c8bb918-5c52-4973-a247-1f38d5ef1cdd"
  pm_tls_insecure = true
}

module "my_vm" {
  source = "./modules/proxmox_vm"

  # Pass provider explicitly
  providers = {
    proxmox = proxmox
  }

  vm_name   = "terraform-test-vm"
  node      = "pve"
  template  = "ubuntu-22.04-template"
  cores     = 2
  memory    = 2048
  disk_size = "20G"
  bridge    = "vmbr0"
  ssh_keys  = file("C:/Users/vishnu/.ssh/id_rsa.pub")
}
