
# ==================================== #
#Required
variable "name" {
  type = string
}

variable "service_account" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "coldpath_inference_url" {
  type = string
}

variable "disk_image" {
  type        = string
  default     = ""
  description = "description"
}

variable "disk_size" {
  type        = string
  default     = ""
  description = "description"
}

# ==================================== #
variable "scopes" {
  type    = list(any)
  default = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "machine_type" {
  type    = string
  default = "n1-standard-2"
}

variable "tags" {
  type    = list(any)
  default = [""]
}
# ==================================== #