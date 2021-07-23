output "url" {
  value = var.deploy ? google_cloud_run_service.run.*.status[0][0]["url"] : ""
}

output "urls" {
  value = var.deploy ? google_cloud_run_service.run.*.status : []
}

output "id" {
  value = var.deploy ? google_cloud_run_service.run.*.id[0] : ""
}

output "ids" {
  value = var.deploy ? google_cloud_run_service.run.*.id : []
}

output "name" {
  value = var.deploy ? google_cloud_run_service.run.*.name[0] : ""
}

output "names" {
  value = var.deploy ? google_cloud_run_service.run.*.name : []
}