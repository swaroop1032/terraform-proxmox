resource "proxmox_vm_qemu" "this" {
  name        = var.name
  target_node = var.node
  clone       = var.clone_template

  # CPU / memory
  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory
  scsihw  = var.scsihw

  # Disk
  disk {
    size    = var.disk_size
    storage = var.disk_storage
    type    = var.disk_type
  }

  # Network (single NIC example)
  network {
    model  = var.net_model
    bridge = var.net_bridge
  }

  os_type   = var.os_type
  ipconfig0 = var.ipconfig0

  onboot = var.onboot
  # Optional: add more fields as needed (cloud-init user data, etc.)
}
