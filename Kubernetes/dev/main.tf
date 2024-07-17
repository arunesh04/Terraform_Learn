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

module "deployment" {
  source = "../modules/deployments"
  image = var.image
  replicas = var.replicas
}

module "services" {
  source = "../modules/services"
  app = module.deployment.kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
}