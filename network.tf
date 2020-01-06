resource "google_compute_network" "vpc" {

  name = "vpc"
  auto_create_subnetworks = false

  depends_on = [google_project_service.compute]
}

resource "google_compute_subnetwork" "container_subnetwork" {
  name          = "container-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpc.self_link
}
