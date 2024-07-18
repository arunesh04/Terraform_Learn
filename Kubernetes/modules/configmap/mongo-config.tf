resource "kubernetes_config_map" "mongoconfig" {
  metadata {
    name = "mongodb-config"
    namespace = var.namespace2
  }

  data = {
    username = var.username
    password = var.password
  }
}
