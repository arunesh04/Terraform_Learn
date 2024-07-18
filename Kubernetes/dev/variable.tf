variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

variable "image" {
    type = string 
}

variable "replicas-nginx" {
    type = number
}

variable "namespace1" {
    type = string
}

variable "namespace2" {
    type = string
}

