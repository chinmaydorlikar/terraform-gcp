variable "deploy" {
  default = false
}
variable "name" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""

}

variable "cidr_range" {
  type    = string
  default = ""

}

variable "network" {
  type    = string
  default = ""
}