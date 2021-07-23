output "id" {
  value       = google_compute_region_network_endpoint_group.default.id
  description = "An identifier for the resource with format : projects/{{project}}/regions/{{region}}/networkEndpointGroups/{{name}}"
}

output "self_link" {
  value       = google_compute_region_network_endpoint_group.default.self_link
  description = "The URI of the created resource."
}