module "nextcloud" {
  source = "../proxmox_vm"

  vm_id = "101"
  vm_name = "nextcloud.lan.mycka.net"

  description = "Nextcloud server"
  target_node = "pve1"

  cores = 2
  memory = 4096

  disk_size = "100G"
  ip_config = "ip=172.30.20.101/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "docker_host" {
  source = "../proxmox_vm"

  vm_id = "102"
  vm_name = "docker-host.lan.mycka.net"

  description = "Docker host"
  target_node = "pve2"

  cores = 4
  memory = 8192

  disk_size = "100G"
  ip_config = "ip=172.30.20.102/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "pihole1" {
  source = "../proxmox_vm"

  vm_id = "103"
  vm_name = "pihole1.lan.mycka.net"

  description = "Pi-hole server"
  target_node = "pve1"

  cores = 1
  memory = 2048

  disk_size = "10G"
  ip_config = "ip=172.30.20.11/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "pihole2" {
  source = "../proxmox_vm"

  vm_id = "104"
  vm_name = "pihole2.lan.mycka.net"

  description = "Pi-hole server"
  target_node = "pve2"

  cores = 1
  memory = 2048

  disk_size = "10G"
  ip_config = "ip=172.30.20.12/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "bind1" {
  source = "../proxmox_vm"

  vm_id = "105"
  vm_name = "bind1.lan.mycka.net"

  description = "Bind9 server number 1"
  target_node = "pve1"

  cores = 1
  memory = 2048

  disk_size = "10G"
  ip_config = "ip=172.30.20.21/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "bind2" {
  source = "../proxmox_vm"

  vm_id = "106"
  vm_name = "bind2.lan.mycka.net"

  description = "Bind9 server number 2"
  target_node = "pve2"

  cores = 1
  memory = 2048

  disk_size = "10G"
  ip_config = "ip=172.30.20.22/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "mysql" {
  source = "../proxmox_vm"

  vm_id = "107"
  vm_name = "mysql.lan.mycka.net"
  
  description = "Mariadb server"
  target_node = "pve2"
  cores = "1"
  memory = "2038"
  
  disk_size = "20G"
  ip_config = "ip=172.30.20.107/24,gw=172.30.20.1"
  vlan_tag = "20"

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}