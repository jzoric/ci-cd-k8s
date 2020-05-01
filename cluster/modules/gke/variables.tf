variable "project" {
  type = string
  default = "jovica-gcp"
  description = "Google Cloud project name"
}

variable "region" {
  type = string
  default = "europe-west4"
  description = "Default Google Cloud region"
}

variable "general_purpose_machine_type" {
  type = string
  default = "n1-standard-1"
  description = "Machine type to use for the general-purpose node pool. See https://cloud.google.com/compute/docs/machine-types"
}

variable "general_purpose_min_node_count" {
  type = string
  description = "The minimum number of nodes PER ZONE in the general-purpose node pool"
  default = 1
}

variable "general_purpose_max_node_count" {
  type = string
  description = "The maximum number of nodes PER ZONE in the general-purpose node pool"
  default = 3
}
