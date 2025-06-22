variable "velero_namespace" {
  type = string
  default     = "velero"
}

variable "velero_provider" {
  type = string
  default     = "aws"
}

variable "bucket_name" {
  type = string
  default     = "badr-project-backup-s3-1749924465"
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_oidc_issuer_url" {
  type = string
}
