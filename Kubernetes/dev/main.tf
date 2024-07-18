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

  image-nginx = var.image-nginx
  replicas-nginx = var.replicas-nginx

  image-mongo = var.image-mongo
  replicas-mongo = var.replicas-mongo

  namespaces1 = module.namespaces.namespace1
  namespaces2 = module.namespaces.namespace2
  
}

module "services" {
  source = "../modules/services"
  app = module.deployments.app
  namespaces1 = module.namespaces.namespace1
  namespaces2 = module.namespaces.namespace2
  app-mongo = module.deployments.app-mongo
}

module "namespaces" {
  source = "../modules/namespaces"
  name1 = var.namespace1
  name2 = var.namespace2
}

module "configmap" {
  source = "../modules/configmap"
  username = var.username
  password = var.password
  namespace2 = var.namespace2
}