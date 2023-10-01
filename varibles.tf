variable "vnet" {
  description = "this block is used to set the name of vnet"
  type        = string
  default     = "vnet"
}

variable "vnet-address" {
  description = "address space for my vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet" {
  description = "this block is used to set the name of subnet"
  type        = string
  default     = "work-sn-var-blk"
}

variable "subnet-add-space" {
  description = "address space for my work subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "nsg" {
  description = "this block is used to set the name of nsg"
  type        = string
  default     = "nsg-var-blk"
}