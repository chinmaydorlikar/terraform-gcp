output key_id {
  value = google_service_account_key.default.id
}

output private_key {
  value = google_service_account_key.default.private_key
}

output public_key {
  value = google_service_account_key.default.private_key
}