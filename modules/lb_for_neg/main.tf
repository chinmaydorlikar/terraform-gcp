# locals {
#   domain = var.domain
# }

# Create a backend service
resource "google_compute_backend_service" "neg_backend" {
  name        = var.backend_name
  description = "Terraform managed : backend for neg"
  enable_cdn  = true
  dynamic "backend" {
    for_each = var.neg_group
    content {
      capacity_scaler = 1.0
      max_utilization = 1.0
      description     = "Terraform managed."
      group           = backend.value
    }
  }
}

# create a URL map
resource "google_compute_url_map" "cdn_url_map" {
  name            = var.urlmap_name
  description     = "CDN URL map to neg_backend"
  default_service = google_compute_backend_service.neg_backend.self_link
  project         = var.project_id
}

# Create the SSL certs for the domain
# resource google_compute_managed_ssl_certificate ssl_certificate {
#   provider = google-beta
#   project  = var.project_id
#   name     = var.ssl_name
#   managed {
#     domains = [local.domain]
#   }
# }

# Create https proxy
# resource google_compute_target_https_proxy https_proxy {
#   name             = var.https_name
#   url_map          = google_compute_url_map.cdn_url_map.self_link
#   ssl_certificates = [google_compute_managed_ssl_certificate.ssl_certificate.self_link]
#   project          = var.project_id
# }

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.https_name
  url_map = google_compute_url_map.cdn_url_map.id
}

# Create global address ip
resource "google_compute_global_address" "public_address" {
  name         = var.public_address_name
  ip_version   = var.ip_type
  address_type = var.address_type
  project      = var.project_id
}

# Create a global forwarding rule
resource "google_compute_global_forwarding_rule" "global_forwarding_rule" {
  name       = var.global-forwarding-https-rule
  target     = google_compute_target_http_proxy.http_proxy.self_link
  ip_address = google_compute_global_address.public_address.address
  port_range = var.port_range
  project    = var.project_id
}