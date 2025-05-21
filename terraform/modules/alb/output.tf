output "ingress_name" {
  description = "생성된 Ingress 리소스의 이름"
  value       = kubernetes_ingress_v1.api_ingress.metadata[0].name
}

output "ingress_namespace" {
  description = "Ingress가 배포된 네임스페이스"
  value       = kubernetes_ingress_v1.api_ingress.metadata[0].namespace
}

output "alb_dns_name" {
  description = "ALB의 DNS 이름 (Ingress 상태)"
  value       = kubernetes_ingress_v1.api_ingress.status[0].load_balancer[0].ingress[0].hostname
}
