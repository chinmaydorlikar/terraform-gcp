locals {
  location-prefix = (
    length(split("-", var.location)) != 2
    ? var.location
    : "${substr(split("-", var.location)[0], 0, 2)}${substr(split("-", var.location)[1], 0, 1)}${substr(strrev(split("-", var.location)[1]), 0, 1)}"
  )
  prefix = (
    var.prefix == null || var.prefix == "" # keep "" for backward compatibility
    ? ""
    : join("-", [var.prefix, lower(local.location-prefix), ""])
  )
}

resource "google_storage_bucket" "bucket" {
  name                        = "${local.prefix}${lower(var.name)}"
  project                     = var.project_id
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  versioning {
    enabled = var.versioning
  }
  labels = merge(var.labels, {
    location      = lower(var.location)
    name          = lower(var.name)
    storage_class = lower(var.storage_class)
  })

  dynamic "encryption" {
    for_each = var.encryption_key == null ? [] : [""]

    content {
      default_kms_key_name = var.encryption_key
    }
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [""]
    content {
      retention_period = var.retention_policy.retention_period
      is_locked        = var.retention_policy.is_locked
    }
  }

  dynamic "logging" {
    for_each = var.logging_config == null ? [] : [""]
    content {
      log_bucket        = var.logging_config.log_bucket
      log_object_prefix = var.logging_config.log_object_prefix
    }
  }

  dynamic "cors" {
    for_each = var.cors == null ? [] : [""]
    content {
      origin          = var.cors.origin
      method          = var.cors.method
      response_header = var.cors.header
      max_age_seconds = var.cors.max_age_seconds
    }
  }
}

resource "google_storage_bucket_iam_binding" "bindings" {
  for_each = var.iam
  bucket   = google_storage_bucket.bucket.name
  role     = each.key
  members  = each.value
}