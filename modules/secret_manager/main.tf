locals {
  secrets_labels = {
    resource_type = "secret_manager_secret",
    project       = var.project_id,
    creation_type = "terraform_managed",
    initiative    = var.init
  }
}

resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret_id

  labels = local.secrets_labels

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret = google_secret_manager_secret.secret.id

  secret_data = var.secret_data
}