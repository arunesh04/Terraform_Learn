output "app" {
  value = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
}