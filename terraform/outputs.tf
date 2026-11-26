output "vpc_id" {
  description = "ID of the provisioned VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the isolated private subnet"
  value       = aws_subnet.private.id
}

output "ec2_instance_id" {
  description = "EC2 web server instance ID (also accessible via AWS SSM Session Manager)"
  value       = aws_instance.web.id
}

output "ec2_public_ip" {
  description = "Public IPv4 address of the EC2 web server"
  value       = aws_instance.web.public_ip
}

output "web_health_url" {
  description = "Nginx health check endpoint URL"
  value       = "http://${aws_instance.web.public_ip}/healthz"
}

output "logs_bucket_name" {
  description = "Private encrypted S3 bucket for log archival"
  value       = aws_s3_bucket.logs.bucket
}
