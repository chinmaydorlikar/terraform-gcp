resource "google_ml_engine_model" "default" {
  name                              = var.name
  description                       = var.description
  regions                           = var.regions
  online_prediction_logging         = var.logging
  online_prediction_console_logging = var.console_logging
}