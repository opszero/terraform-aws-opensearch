output "domain_arn" {
  value       = module.opensearch.domain_arn
  description = "The Amazon Resource Name (ARN) of the domain"
}

output "domain_id" {
  value       = module.opensearch.domain_id
  description = "The unique identifier for the domain"
}

output "domain_endpoint" {
  value       = module.opensearch.domain_endpoint
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
}

output "domain_dashboard_endpoint" {
  value       = module.opensearch.domain_dashboard_endpoint
  description = "Domain-specific endpoint for Dashboard without https scheme"
}

output "package_associations" {
  value       = module.opensearch.package_associations
  description = "Map of package associations created and their attributes"
}

output "vpc_endpoints" {
  value       = module.opensearch.vpc_endpoints
  description = "Map of VPC endpoints created and their attributes"
}

output "outbound_connections" {
  value       = module.opensearch.outbound_connections
  description = "Map of outbound connections created and their attributes"
}

output "cloudwatch_logs" {
  value       = module.opensearch.cloudwatch_logs
  description = "Map of CloudWatch log groups created and their attributes"
}

output "security_group_arn" {
  value       = module.opensearch.security_group_arn
  description = "Amazon Resource Name (ARN) of the security group"
}

output "security_group_id" {
  value       = module.opensearch.security_group_id
  description = "ID of the security group"
}

output "master_user_name" {
  value       = module.opensearch.master_user_name
  description = "The master user name for the AWS OpenSearch domain."
}

output "master_user_password" {
  value       = module.opensearch.master_user_password
  sensitive   = true
  description = "The master user password for the AWS OpenSearch domain."

}