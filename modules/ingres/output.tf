output "badr-project_server_load_balancer" {
  value = kubernetes_ingress_v1.badr-project-ingress.status.0.load_balancer.0.ingress.0.hostname
}
