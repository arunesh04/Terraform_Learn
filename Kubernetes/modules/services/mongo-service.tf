resource "kubernetes_service" "mongo" {
  metadata {
    name = "mongo-service"
    namespace = var.namespaces2
  }
  spec {
    selector = {
      App = var.app-mongo
    }
    port {
      node_port   = 30001
      port        = 27017
      target_port = 27017
    }

    type = "NodePort"
  }
}
