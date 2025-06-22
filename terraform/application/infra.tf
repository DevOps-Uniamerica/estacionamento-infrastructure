provider "google" {
  project = var.project
  region  = "southamerica-east1"
}

resource "google_container_cluster" "k8s" {
  name     = "k8s-cluster"
  location = "southamerica-east1"

  # Cluster Autopilot (não precisa gerenciar node pool manualmente)
  autopilot {
    enabled = true
  }

  network    = "default"
  subnetwork = "default"

  ip_allocation_policy {}
}

resource "google_compute_firewall" "allow_k8s_services" {
  name    = "allow-k8s-services"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "3000", "9090", "80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}

output "cluster_name" {
  value = google_container_cluster.k8s.name
}

output "cluster_location" {
  value = google_container_cluster.k8s.location
}
