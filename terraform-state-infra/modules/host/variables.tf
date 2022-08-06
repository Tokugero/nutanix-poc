variable "cluster" {
  type = any
}

variable "cpus" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "ip" {
  type = string
}

variable "memory_size" {
  type    = number
  default = 1024
}

variable "name" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}
