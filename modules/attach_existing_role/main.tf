resource google_project_iam_member binding_the_role_to_sa {
  project = var.project_id
  role    = var.role
  member  = "serviceAccount:${var.service_account}"
}