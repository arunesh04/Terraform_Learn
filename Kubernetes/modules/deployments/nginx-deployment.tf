resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    namespace = var.namespaces1
    labels = {
      app = "Nginx"
    }
  }

  spec {
    replicas = var.replicas-nginx
    selector {
      match_labels = {
        App = "Nginx"
      }
    }
    template {
      metadata {
        labels = {
          App = "Nginx"
        }
      }
      spec {
        container {
          image = var.image-nginx
          name  = "nginx"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
