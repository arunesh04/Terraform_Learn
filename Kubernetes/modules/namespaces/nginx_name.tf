resource "kubernetes_namespace" "name" {
  metadata {
    name = var.name
  }
}