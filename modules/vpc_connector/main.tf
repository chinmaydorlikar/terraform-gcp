resource "google_vpc_access_connector" "connector" {
  count         = var.deploy ? 1 : 0
  name          = var.name
  region        = var.region
  ip_cidr_range = var.cidr_range
  network       = var.network
}