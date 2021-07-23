locals {
  ips = flatten([
    for i in range(length(var.ips)) : {
      priority = i
      ip       = var.ips[i]
    }
  ])
}
resource "google_compute_security_policy" "policy" {
  name = var.name

  dynamic "rule" {
    for_each = local.ips
    content {
      action   = "allow"
      priority = rule.value["priority"]
      match {
        versioned_expr = "SRC_IPS_V1"
        config {
          src_ip_ranges = [rule.value["ip"]]
        }
      }
      description = "Terraform managed : allow-${rule.value["ip"]}"
    }
  }

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default deny rule"
  }
}