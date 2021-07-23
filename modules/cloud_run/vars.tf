variable deploy {
  type    = bool
  default = false
}

variable unauthenticated {
  type    = bool
  default = false
}
#Required
variable name {
  type = string
}

variable location {
  type    = string
  default = ""
}

variable image {
  type    = string
  default = ""
}

variable service_account_name {
  type    = string
  default = ""
}

variable env_vars {
  type    = map(string)
  default = {}
}

variable sql_connection_name {
  type    = string
  default = ""
}

variable vpc_connector {
  type    = string
  default = ""
}

variable concurrency {
  type    = string
  default = "45"
}

variable container_cpu {
  type    = string
  default = "2"
}

variable container_memory {
  type    = string
  default = "2Gi"
}

variable min_containers {
  type    = string
  default = "0"
}

variable max_containers {
  type    = string
  default = "1000"
}