resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.type
  tags         = var.firewall_tags
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = var.network_name
    subnetwork = var.subnet
    dynamic "access_config" {
      for_each = var.is_private != true ? [1] : []
      // Ephemeral public IP
      content {

      }
    }

  }

  metadata = google_compute_project_metadata.pub_key.metadata
}

resource "google_compute_project_metadata" "pub_key" {
  metadata = {
    ssh-keys = "${var.ssh_key.username}:${var.ssh_key.public_key}"
  }
}


