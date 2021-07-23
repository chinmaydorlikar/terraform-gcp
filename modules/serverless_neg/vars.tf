#Required
variable "name" {
  type        = string
  description = "The name of the neg being created"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The region where the neg will be created"
}

#Required
variable "service" {
  type        = string
  description = "The serverless service which will be a part of the neg to be created"
}
