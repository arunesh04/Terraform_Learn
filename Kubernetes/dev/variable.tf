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

variable "image-nginx" {
    type = string 
}
variable "image-mongo" {
    type = string 
}
variable "replicas-nginx" {
    type = number
}
variable "replicas-mongo" {
    type = number
}

variable "namespace1" {
    type = string
}

variable "namespace2" {
    type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

