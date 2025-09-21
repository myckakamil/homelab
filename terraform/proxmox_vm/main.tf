resource "proxmox_vm_qemu" "vm" {
  vmid        = var.vm_id
  name        = var.vm_name
  desc        = var.description
  target_node = var.target_node
  clone       = var.clone_template
  full_clone  = var.full_clone
  agent       = 1
  os_type     = "cloud-init"
  onboot      = var.onboot
  tags        = var.tags

  dynamic "serial" {
    for_each = var.enable_serial ? [1] : []
    content {
      id   = 0
      type = "socket"
    }
  }

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = var.cpu_type
  }

  memory = var.memory
  scsihw = var.scsi_controller
  
  disk {
    type = "cloudinit"
    storage = var.cloudinit_storage
    slot = "ide2"
  }

  disk {
    type = "disk"
    slot = "scsi0"
    size = var.disk_size
    storage = var.disk_storage
    discard = var.enable_discard
  }

  dynamic "disk" {
    for_each = var.extra_disks
    content {
      type    = disk.value.type
      storage = disk.value.storage
      size    = disk.value.size
      slot    = disk.value.slot
      discard = disk.value.discard ? true : false
    }
  }

  network {
    id       = 0
    model    = var.network_model
    bridge   = var.network_bridge
    firewall = var.enable_firewall
    tag      = var.vlan_tag
  }

  boot = "order=scsi0"
  ipconfig0 = var.ip_config
  ciuser    = var.cloudinit_user
  sshkeys   = var.ssh_public_key
  cipassword = var.cloudinit_password
}