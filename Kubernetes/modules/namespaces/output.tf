output "namespace1" {
  value = kubernetes_namespace.name1.metadata.0.name
}

output "namespace2" {
  value = kubernetes_namespace.name2.metadata.0.name
}