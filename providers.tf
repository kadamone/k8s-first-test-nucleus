provider "google" {
  credentials = file("/home/radu/terraform/gcp-key/flask-app-fe18fe252bab.json")
  #credentials = var.credentials_file

  project = var.google_project_id
  region  = var.google_region
  #zone    = var.zone
  # project = "flask-app-262012"
}

#provider "kubernetes" {
#  host = google_container_cluster.kube.endpoint
#  token = data.google_client_config.default.access_token
#  cluster_ca_certificate = base64decode(google_container_cluster.kube.master_auth.0.cluster_ca_certificate)
#}
