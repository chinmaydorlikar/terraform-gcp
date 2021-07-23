resource google_cloud_tasks_queue google_cloud_task {
  name     = var.task_name
  location = var.region

  app_engine_routing_override {
    /* host = var.app_engine_host */
    service = "default"
  }

  rate_limits {
    max_dispatches_per_second = var.max_rate
    max_concurrent_dispatches = var.max_concurrent_dispatches
    /* max_burst_size            = var.max_burst_size */
  }

  retry_config {
    max_attempts       = var.max_attempts
    max_retry_duration = var.max_retry_duration
    max_backoff        = var.max_backoff
    min_backoff        = var.min_backoff
    max_doublings      = var.max_doublings
  }

  stackdriver_logging_config {
    sampling_ratio = 1
  }
}