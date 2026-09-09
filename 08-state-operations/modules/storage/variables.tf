variable "bucket_name" {
  description = "The aws bucket name"
  type = string
}

variable "cidr_block" {
  description = "The IP address for our vpc"
  type = string
  validation {
    condition = can(cidrnetmask(var.cidr_block))
    error_message = "Not a valid cidr block"
  }
}