variable "name" {
  type        = string
  description = "Name of instnace"
}

variable "type" {
  type        = string
  description = "type of vm instance"
  default     = "f1-micro"
}

variable "network_name" {
  type        = string
  description = "vpc network name"
}

variable "firewall_tags" {
  type        = list(string)
  description = "List of firewall rule taged into the instance"
  default     = []
}

variable "is_private" {
  type        = bool
  description = "whether or not the vm is private instance"
}

variable "subnet" {
  type        = string
  description = "subnetwork name"
}

variable "ssh_public_keyfile" {
  type        = string
  description = "ssh public key added into the instance"
  default     = ""
}
