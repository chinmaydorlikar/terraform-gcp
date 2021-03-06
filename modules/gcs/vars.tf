variable "uniform_bucket_level_access" {
  description = "Allow using object ACLs (false) or not (true, this is the recommended behavior) , defaults to true (which is the recommended practice, but not the behavior of storage API)."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Optional map to set force destroy keyed by name, defaults to false."
  type        = bool
  default     = false
}

variable "iam" {
  description = "IAM bindings in {ROLE => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}

variable "encryption_key" {
  description = "KMS key that will be used for encryption."
  type        = string
  default     = null
}

variable "labels" {
  description = "Labels to be attached to all buckets."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "EU"
}

variable "logging_config" {
  description = "Bucket logging configuration."
  type = object({
    log_bucket        = string
    log_object_prefix = string
  })
  default = null
}

variable "name" {
  description = "Bucket name suffix."
  type        = string
}

variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  default     = null
}

variable "project_id" {
  description = "Bucket project id."
  type        = string
}

variable "retention_policy" {
  description = "Bucket retention policy."
  type = object({
    retention_period = number
    is_locked        = bool
  })
  default = null
}

variable "storage_class" {
  description = "Bucket storage class."
  type        = string
  default     = "STANDARD"
  validation {
    condition     = contains(["STANDARD", "MULTI_REGIONAL", "REGIONAL", "NEARLINE", "COLDLINE", "ARCHIVE"], var.storage_class)
    error_message = "Storage class must be one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  }
}

variable "versioning" {
  description = "Enable versioning, defaults to false."
  type        = bool
  default     = false
}


variable cors {
  description = "Enable CORS, defaults to null."
  type = object({
    origin          = list(string)
    header          = list(string)
    method          = list(string)
    max_age_seconds = number
  })
  default = null
}