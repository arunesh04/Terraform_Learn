resource "kubernetes_namespace" "name1" {
  metadata {
    name = var.name1
  }
}

resource "kubernetes_namespace" "name2" {
  metadata {
    name = var.name2
  }
}