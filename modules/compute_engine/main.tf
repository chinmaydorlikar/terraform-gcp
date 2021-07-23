data "template_file" "startup_script" {
  template = file("${path.module}/coldpath_startup.sh")
  vars = {
    api_url = var.coldpath_inference_url
  }
}

resource "google_compute_instance" "vm_instance" {
  name                    = var.name
  machine_type            = var.machine_type
  zone                    = var.zone
  tags                    = var.tags
  metadata_startup_script = data.template_file.startup_script.rendered

  boot_disk {
    auto_delete = false
    device_name = "${var.name}-boot"
    initialize_params {
      image = var.disk_image
      size  = var.disk_size
    }
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  metadata = {
    enable-guest-attributes = "true",
    enable-os-inventory     = "true",
    enable-osconfig         = "true",
  }

  service_account {
    email  = var.service_account
    scopes = var.scopes
  }

}