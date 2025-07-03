variable "proxmox_api_url" {
  type      = string
  default = "https://172.30.50.101:8006/api2/json"
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}