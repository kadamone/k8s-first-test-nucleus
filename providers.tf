provider "google" {
#  credentials = file("/home/radu/terraform/gcp-key/flask-app-fe18fe252bab.json")
  #credentials = var.credentials_file

  credentials = file("flask-app-fe18fe252bab.json")
  project = var.google_project_id
  region  = var.google_region
  #zone    = var.zone
}

provider "kubernetes" {
  version = "v1.9.0"

  host = google_container_cluster.kube.endpoint
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.kube.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  version = "0.10.4"

  kubernetes {
    host = google_container_cluster.kube.endpoint
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.kube.master_auth.0.cluster_ca_certificate)
  }

  tiller_image = "gcr.io/kubernetes-helm/tiller:${var.tiller_version}"
  service_account = kubernetes_service_account.tiller.metadata.0.name
}
