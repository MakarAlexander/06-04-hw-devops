###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "ssh_public_key" {
  type        = string
  description = "Location of SSH public key."
  default     = "~/.ssh/id_ed25519.pub"
}

variable "packages" {
  type    = list(string)
  default = ["vim", "nginx"]
}

#marketing-vm

variable "marketing_vm_env" {
  type        = string
  default     = "develop"
}

variable "marketing_vm_instance_name" {
  type        = string
  default     = "marketing-web"
}

variable "marketing_vm_instance_count" {
  type        = number
  default     = 1
}

variable "marketing_vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "marketing_vm_public_ip" {
  type        = bool
  default     = true
}

variable "marketing_vm_serial_port_enable" {
  type        = bool
  default     = true
}

variable "marketing_vm_labels" {
  type = map
  default = {
    "owner"     = "cloud-alex"
    "project"   = "marketing"
    }
}

#analytics-vm

variable "analytics_vm_env" {
  type        = string
  default     = "stage"
}

variable "analytics_vm_instance_name" {
  type        = string
  default     = "analytics-web"
}

variable "analytics_vm_instance_count" {
  type        = number
  default     = 1
}

variable "analytics_vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "analytics_vm_public_ip" {
  type        = bool
  default     = true
}

variable "analytics_vm_serial_port_enable" {
  type        = bool
  default     = true
}

variable "analytics_vm_labels" {
  type = map
  default = {
    "owner"     = "cloud-alex"
    "project"   = "analytics"
    }
}