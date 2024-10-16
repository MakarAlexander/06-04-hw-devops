variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "n-e-t-w-o-r-k"
}

variable "subnet_name" {
  description = "The name of the VPC subnet"
  type        = string
  default     = "s-u-b-n-e-t-w-o-r-k"
}

variable "zone" {
  description = "The availability zone where the subnet will be created"
  type        = string
  default     = "ru-central1-a"
}

variable "v4_cidr_blocks" {
  description = "IPv4 CIDR blocks for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}