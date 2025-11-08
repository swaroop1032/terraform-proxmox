terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      # pin a tested version in production; omit or adjust here for testing
      version = ">= 2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
}

module "example_vm" {
  source         = "./modules/vm"
  name           = var.vm_name
  node           = var.node
  clone_template = var.clone_template

  cores          = var.cores
  memory         = var.memory
  disk_size      = var.disk_size
  net_bridge     = var.net_bridge
}
