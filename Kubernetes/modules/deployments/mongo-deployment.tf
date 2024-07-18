resource "kubernetes_deployment" "mongo" {
  metadata {
    name = "mongo-deployment"
    namespace = var.namespaces2
    labels = {
      app = "mongo"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "mongo"
      }
    }

    replicas = var.replicas-mongo

    template {
      metadata {
        labels = {
          app = "mongo"
        }
      }

      spec {
        container {
          name  = "mongo"
          image = var.image-mongo
          port {
            container_port = 27017
          }
          env {
            name = "MONGO_INITDB_ROOT_USERNAME"
            value_from {
              config_map_key_ref {
                name = "mongodb-config"
                key  = "username"
              }
            }
          }
          env {
            name = "MONGO_INITDB_ROOT_PASSWORD"
            value_from {
              config_map_key_ref {
                name = "mongodb-config"
                key  = "password"
              }
            }
          }
          
        }
      }
    }
  }
}