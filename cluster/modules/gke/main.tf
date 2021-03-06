resource "google_container_cluster" "cluster" {
  name     = "${var.project}-cluster"
  location = var.region

  min_master_version = "1.15"

  remove_default_node_pool = true
  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  addons_config {
    network_policy_config {
      disabled = "false"
    }
  }

  network_policy {
    enabled = "true"
    provider = "CALICO"
  }
}

resource "google_container_node_pool" "general_purpose" {
  name       = "${var.project}-general"
  location   = var.region
  cluster    = google_container_cluster.cluster.name

  management {
    auto_repair = "true"
    auto_upgrade = "true"
  }

  autoscaling {
    min_node_count = var.general_purpose_min_node_count
    max_node_count = var.general_purpose_max_node_count
  }
  initial_node_count = var.general_purpose_min_node_count

  node_config {
    machine_type = var.general_purpose_machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # Needed for correctly functioning cluster, see
    # https://www.terraform.io/docs/providers/google/r/container_cluster.html#oauth_scopes
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/pubsub"
    ]
  }
}
