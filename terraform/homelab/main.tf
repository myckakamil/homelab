module "docker_host" {
  source = "../proxmox_vm"

  vm_id = "101"
  vm_name = "docker-host.lan.mycka.net"

  description = "Docker host"
  target_node = "pve2"

  cores = 4
  memory = 8192

  disk_size = "100G"
  ip_config = "ip=172.30.20.101/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}

module "nextcloud" {
  source = "../proxmox_vm"

  vm_id = "102"
  vm_name = "nextcloud.lan.mycka.net"

  description = "Nextcloud server"
  target_node = "pve1"

  cores = 2
  memory = 4096

  disk_size = "100G"
  ip_config = "ip=172.30.20.102/24,gw=172.30.20.1"
  vlan_tag = 20

  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJF3mRlmUdCwWujN49vBX6n1cmp1CwEtqsYZf8eUftzt kamil"
}