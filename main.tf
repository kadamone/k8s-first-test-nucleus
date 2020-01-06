resource "google_project_service" "serviceusage" {
  service = "serviceusage.googleapis.com"

  #disable_dependent_services = true
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"

  depends_on = [google_project_service.serviceusage]

  #disable_dependent_services = true
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"

  depends_on = [
    google_project_service.serviceusage,
    google_project_service.iam,
    google_project_service.storage_api,
    google_project_service.compute,
    google_project_service.containerregistry
  ]

#  disable_dependent_services = true
}

resource "google_project_service" "containerregistry" {
  service = "containerregistry.googleapis.com"

  depends_on = [
    google_project_service.storage_api,
    google_project_service.serviceusage
  ]

#  disable_dependent_services = true
}

resource "google_project_service" "storage_component" {
  service = "storage-component.googleapis.com"

  depends_on = [google_project_service.serviceusage]
}

resource "google_project_service" "storage_api" {
  service = "storage-api.googleapis.com"

  depends_on = [
    google_project_service.serviceusage,
#    google_project_service.containerregistry
  ]

#  disable_dependent_services = true
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"

  depends_on = [google_project_service.serviceusage]
}

resource "google_project_service" "logging" {
  service = "logging.googleapis.com"

  #disable_dependent_services = true

  depends_on = [google_project_service.serviceusage]
}

resource "google_project_service" "monitoring" {
  service = "monitoring.googleapis.com"

  #disable_dependent_services = true

  depends_on = [google_project_service.serviceusage]
}

#resource "google_project_service" "cloudapis" {
#  service = "logging.googleapis.com"

#  depends_on = [
#    google_project_service.monitoring,
#    google_project_service.logging,
#    google_project_service.storage_api,
#    google_project_service.storage_component]
#}
