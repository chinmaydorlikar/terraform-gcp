resource "google_cloud_run_service" "run" {
  count    = var.deploy ? 1 : 0
  name     = var.name
  location = var.location

  template {
    spec {
      containers {
        image = var.image
        dynamic "env" {
          for_each = var.env_vars
          content {
            name  = env.key
            value = env.value
          }
        }
        resources {
          limits = {
            cpu    = var.container_cpu
            memory = var.container_memory
          }
        }
      }
      service_account_name  = var.service_account_name
      container_concurrency = var.concurrency
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"        = var.min_containers
        "autoscaling.knative.dev/maxScale"        = var.max_containers
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector == "" ? null : var.vpc_connector
        "run.googleapis.com/vpc-access-egress"    = var.vpc_connector == "" ? null : "private-ranges-only"
        # "run.googleapis.com/cloudsql-instances"   = var.sql_connection_name
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  lifecycle {
    ignore_changes = all
  }

}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  count    = var.unauthenticated ? 1 : 0
  location = google_cloud_run_service.run.*.location[count.index]
  project  = google_cloud_run_service.run.*.project[count.index]
  service  = google_cloud_run_service.run.*.name[count.index]

  policy_data = data.google_iam_policy.noauth.policy_data
}