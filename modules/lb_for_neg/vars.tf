#Required
variable "project_id" {
  type        = string
  description = "The project id of the project where the resources will be created"
}

#Required
variable "backend_name" {
  type        = string
  description = "The name of the backend which will be created for the load balancer"
}

#Required
variable "neg_group" {
  type        = list(string)
  description = "The list of flly-qualified self links of the neg groups which will be added as backends"
}

#Required
variable "urlmap_name" {
  type        = string
  description = "The name of the url-map(load balancer name) for the LB to be created"
}

#Required
variable "ssl_name" {
  type        = string
  description = "The name of the ssl_certs to be created for the domain to be created"
}

#Required
variable "https_name" {
  type        = string
  description = "The name for https-proxy which will be created for the load balancer"
}

#Required
variable "public_address_name" {
  type        = string
  description = "The name of the public ip which is reserved for the frontend"
}

#Required
variable "global-forwarding-https-rule" {
  type = string
}

variable "ip_type" {
  type        = string
  default     = "IPV4"
  description = "The type of IP to be reserved."
}

variable "address_type" {
  type        = string
  default     = "EXTERNAL"
  description = "The type of address to be reserved (INTERNAL/EXTERNAL)"
}

variable "port_range" {
  type        = string
  default     = "80"
  description = "The target port for the load balancer"
}

variable "domain" {
  type        = string
  description = "The domain which will be attached to the Load Balancer"
  default     = ""
}
