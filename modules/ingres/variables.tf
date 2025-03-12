variable "profile" {
  type = string
}

variable "namespace" {
  type = string
}

variable "root_domain_name" {
  type = string
}

variable "badr-project_frontend_port" {
  type = string
  default = "5173"
}

variable "badr-project_server_port" {
  type = string
  default = "5001"
}
