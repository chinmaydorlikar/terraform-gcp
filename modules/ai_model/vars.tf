#Required
variable "name" {
  type        = string
  description = "Name of the AI Platform Model to be created"
}

variable "regions" {
  type        = list(string)
  default     = ["us-central1"]
  description = "The list of regions where the model is going to be deployed. Currently only one region per model is supported"
}

variable "description" {
  type        = string
  default     = "Terraform managed"
  description = "The description of the AI Platform model to be created"
}

variable "logging" {
  default     = true
  description = "If true, online prediction access logs are sent to StackDriver Logging."
}

variable "console_logging" {
  default     = true
  description = "If true, online prediction nodes send stderr and stdout streams to Stackdriver Logging"
}
