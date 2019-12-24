# Google

variable "google_project_id" {
  default = "flask-app-262012"
}

variable "google_region" {
  default = "us-central1"
}

# Kubernetes K8S

variable "k8s_cluster_name" {
  default = "kadamone-cluster"
}

#variable "k8s_node_pools" {
#  type = list(object({
#    name          = string
#    node_count    = number
#    machine_type  = string
#    taints = list(object({
#      key     = string
#      value   = string
#      effect  = string
#      }))
#    }))
#}

#variable "k8s_namespaces" {
#  type = list(object({
#    name          = string      # Name of the namespace
#    has_public_ip = bool
#    dns_records   = set(string)
#    uses_postgres = bool        # If set true postgres_enabled should be true
#    uses_mysql    = bool        # if set true mysql_enabled should be true
#    }))
#}

# DNS

#variable "dns_domain" {}
