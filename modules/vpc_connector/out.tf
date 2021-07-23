output "id" {
  value = length(google_vpc_access_connector.connector.*.id) >= 1 ? google_vpc_access_connector.connector.*.id[0] : "null"
}


output "name" {
  value = length(google_vpc_access_connector.connector.*.name) >= 1 ? google_vpc_access_connector.connector.*.name[0] : "null"
}