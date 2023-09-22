provider "google" {
  credentials = file(var.credentials_file)
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.disk_image
      size  = 40  # Set the size of the boot disk to 40GB
      type  = "pd-ssd"  # Specify the SSD type for the boot disk
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key)}"
  }

  allow_stopping_for_update = true

  tags = ["web"]
}

resource "google_compute_firewall" "allow_ports" {
  name    = "allow-ports-unique"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]   # SSH
  }

  # allow {
  #   protocol = "tcp"
  #   ports    = ["80"]   # HTTP
  # }

  allow {
    protocol = "tcp"
    ports    = ["25000"]  # HTTPS
  }

  # allow {
  #   protocol = "tcp"
  #   ports    = ["5432"] # DB
  # }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}