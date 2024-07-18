resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-service"
    namespace = var.namespaces
  }
  spec {
    selector = {
      App = var.app
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
