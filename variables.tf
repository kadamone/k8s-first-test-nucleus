# Google

variable "google_project_id" {}   #default = "flask-app-262012"
variable "google_region" {}       #default = "us-central1"
variable "google_zone" {}         #default = "us-central1-a"
#variable "environment_name" {}

# Kubernetes - K8S

variable "k8s_cluster_name" {}    #default = "kadamone-cluster"

variable "k8s_node_pools" {
  type = list(object({
    name          = string
    node_count    = number
    machine_type  = string
    taints = list(object({
      key     = string
      value   = string
      effect  = string
      }))
    }))
    default = [{
      name = "nodes"
      node_count = 3
      machine_type = "n1-standard-1"
      taints = []
      }]
}

variable "k8s_namespaces" {
  type = list(object({
    name                = string      # Name of the namespace
    has_public_ip       = bool
    dns_records         = set(string)
    uses_postgres       = bool        # If set true postgres_enabled should be true
    uses_mysql          = bool        # if set true mysql_enabled should be true
    uses_mongodb_atlas  = bool
    uses_slack_alert    = bool     # If true you have to manually create the slack channel on slack
    }))
#  default = [{
#    name                = "kadamone-ns"
#    has_public_ip       = false
#    dns_records         = {}
#    uses_mysql          = false
#    uses_postgres       = false
#    uses_mongodb_atlas  = false
#    uses_slack_alert    = false
#    }]
}

# HELM

variable "tiller_version" {
  default = "v2.15.1"
}

# FLUX

variable "flux_git_url" {}  # default = "git@github.com:kadamone/flux-first-test"

variable "flux_git_path" {} #default = "dev"

variable "flux_version" {
  default = "1.18.0"
}

variable "flux_enabled" {
  type = bool
  default = true
}

variable "flux_manifest_generation" {
  default = true
  type = bool
}

# POSTGRES
variable "postgres_machine_type" {
  default = "db-f1-micro"
}

variable "postgres_database_version" {
  default = "POSTGRES_11" # Postgres version
}

variable "postgres_enabled" {
  default = false # Enable and disable postgres
  type = bool
}

# MYSQL

variable "mysql_machine_type" {
  default = "db-f1-micro"
}

variable "mysql_database_version" {
  default = "MYSQL_5_7" # Mysql database version
}

variable "mysql_enabled" {
  default = false # Enable and disable mysql
  type = bool
}

# DNS

#variable "dns_domain" {}

# Sealed secrets
variable "sealed_secrets_enabled" {
  default = true
  type = bool
}

variable "sealed_secrets_version" {
  default = "v0.9.5"
}
