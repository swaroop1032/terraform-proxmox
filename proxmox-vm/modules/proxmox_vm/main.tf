terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.node
  clone       = var.template
  full_clone  = true

  cores  = var.cores
  memory = var.memory

  disk {
    size = var.disk_size
    type = "scsi"
	storage = var.storage
  }

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  os_type = "cloud-init"
  sshkeys = var.ssh_keys

  tags = "terraform"
}
