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
    machine_type = "e2-micro"
    disk_size_gb = 20
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = ["k8s"]
  }

  initial_node_count = 1
}