#Required
variable task_name {
  type = string
}

#Required
variable region {
  type = string
}

#Required
variable app_engine_host {
  type = string
}

variable max_rate {
  type    = string
  default = "500"
}

variable max_concurrent_dispatches {
  type    = string
  default = "1000"
}

variable max_burst_size {
  type    = string
  default = "100"
}

variable max_attempts {
  type    = string
  default = "5"
}

variable max_retry_duration {
  type    = string
  default = "0s"
}

variable max_backoff {
  type    = string
  default = "3600s"
}

variable min_backoff {
  type    = string
  default = "0.100s"
}

variable max_doublings {
  type    = string
  default = "16"
}