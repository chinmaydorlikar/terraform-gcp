output "id" {
  value       = google_ml_engine_model.default.id
  description = "an identifier for the resource with format : projects/{{project}}/models/{{name}}"
}
