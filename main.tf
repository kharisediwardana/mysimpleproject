terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.32.0"
    }
  }
}

provider "google" {
  project = "myproject-440813"
  region  = "asia-southeast2"
}

resource "google_container_cluster" "primary" {
  name               = "my-gke-cluster"
  location           = "asia-southeast2"
  initial_node_count = 1
  deletion_protection = false
}
