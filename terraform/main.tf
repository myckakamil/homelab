terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "terraform-test" {
  vmid        = "101"
  name        = "nextcloud.lan.mycka.net"
  desc        = "Nextcloud server"
  target_node = "pve1"
  clone       = "debian12-template"
  full_clone  = true
  agent       = 1
  os_type     = "cloud-init"

  serial {
    id   = 0
    type = "socket"
  }

  cpu {
    cores   = 4
    sockets = 1
    type    = "host"
  }

  memory = 4096
  scsihw = "virtio-scsi-pci"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-zfs"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "100G"
          storage = "local-zfs"
          discard = true
        }
      }
    }
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = true
    tag      = 20
  }

  boot = "order=scsi0"

  ipconfig0 = "ip=dhcp"
  ciuser = "kamil"
  sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil
  EOF

}
