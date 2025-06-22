provider "google" {
  project = "${var.project}"
  region  = "southamerica-east1"
}

resource "google_container_cluster" "k8s" {
  name       = "k8s-cluster"
  location   = "southamerica-east1"

  network    = "default"
  subnetwork = "default"

  ip_allocation_policy {}

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = ["k8s"]
  }

  initial_node_count = 1
}

output "cluster_name" {
  description = "O nome do cluster GKE."
  value       = google_container_cluster.k8s.name
}

output "cluster_location" {
  description = "A localização (região/zona) do cluster GKE."
  value       = google_container_cluster.k8s.location
}