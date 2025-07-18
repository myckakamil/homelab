variable "vm_id" {
  type        = string
  description = "Unique VM ID for Proxmox"
}

variable "vm_name" {
  type        = string
  description = "Full hostname for the virtual machine"
}

variable "description" {
  type        = string
  description = "Description of the VM purpose/functionality"
  default     = "Terraform-managed VM"
}

variable "target_node" {
  type        = string
  description = "Proxmox cluster node name where VM will be created"
}

variable "clone_template" {
  type        = string
  description = "Name of the template to clone for new VM"
  default     = "debian12-template"
}

variable "full_clone" {
  type        = bool
  description = "Whether to create a full clone (true) or linked clone (false)"
  default     = true
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 2
}

variable "sockets" {
  type        = number
  description = "Number of CPU sockets"
  default     = 1
}

variable "cpu_type" {
  type        = string
  description = "CPU type"
  default     = "host"
}

variable "memory" {
  type        = number
  description = "RAM allocation in MB"
  default     = 2048
}

variable "scsi_controller" {
  type        = string
  description = "Type of SCSI controller)"
  default     = "virtio-scsi-pci"
}

variable "cloudinit_storage" {
  type        = string
  description = "Storage pool for cloud-init drive"
  default     = "local-zfs"
}

variable "disk_size" {
  type        = string
  description = "Main disk size with unit"
  default     = "20G"
}

variable "disk_storage" {
  type        = string
  description = "Storage pool for main disk"
  default     = "local-zfs"
}

variable "enable_discard" {
  type        = bool
  description = "Enable TRIM/discard support"
  default     = true
}

variable "network_model" {
  type        = string
  description = "Network adapter model"
  default     = "virtio"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge to attach to"
  default     = "vmbr0"
}

variable "enable_firewall" {
  type        = bool
  description = "Enable Proxmox firewall for this interface"
  default     = true
}

variable "vlan_tag" {
  type        = number
  description = "VLAN tag for network interface"
  default     = null
}

variable "ip_config" {
  type        = string
  description = "Cloud-init IP configuration string"
}

variable "cloudinit_user" {
  type        = string
  description = "Default cloud-init user for SSH access"
  default     = "kamil"
}

variable "cloudinit_password" {
  type        = string
  description = "Default cloud-init user for SSH access"
  default     = "changeme"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key to inject via cloud-init"
  default     = ""
}

variable "enable_serial" {
  type        = bool
  description = "Enable serial console interface"
  default     = true
}

variable "os_type" {
  type        = string
  description = "Guest OS type"
  default     = "cloud-init"
}

variable "agent_enabled" {
  type        = number
  description = "Enable QEMU guest agent"
  default     = 1
}

variable "onboot" {
  type        = bool
  description = "Enable start on boot"
  default     = true
}

variable "boot_order" {
  type        = string
  description = "Boot order specification"
  default     = "order=scsi0"
}