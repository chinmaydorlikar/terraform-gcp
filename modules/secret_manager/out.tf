output id {
  value      = google_secret_manager_secret.secret.secret_id
  depends_on = [google_secret_manager_secret_version.secret_version]
}