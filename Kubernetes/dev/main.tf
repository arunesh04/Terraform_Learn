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
  replicas-nginx = var.replicas-nginx
  namespaces1 = module.namespaces.namespace1
  namespaces2 = module.namespaces.namespace2
}

module "services" {
  source = "../modules/services"
  app = module.deployments.app
  namespaces1 = module.namespaces.namespace1
  namespaces2 = module.namespaces.namespace2
}

module "namespaces" {
  source = "../modules/namespaces"
  name1 = var.namespace1
  name2 = var.namespace2
}