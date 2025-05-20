output "vpc_id" {
  description = "생성된 VPC의 ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "퍼블릭 서브넷 A, C의 ID 목록"
  value       = [aws_subnet.public_a.id, aws_subnet.public_c.id]
}

output "internet_gateway_id" {
  description = "인터넷 게이트웨이 ID"
  value       = aws_internet_gateway.igw.id
}

output "route_table_id" {
  description = "퍼블릭 서브넷용 라우팅 테이블 ID"
  value       = aws_route_table.public.id
}
