terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
provider "kubernetes" {
  host = var.host
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

module "deployments" {
  source = "../modules/deployments"
  image = var.image
  replicas = var.replicas
  namespaces = module.namespaces.namespace
}

module "services" {
  source = "../modules/services"
  app = module.deployments.app
  namespaces = module.namespaces.namespace
}

module "namespaces" {
  source = "../modules/namespaces"
  name = var.namespace
}