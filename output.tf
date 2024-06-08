output "web_server_public_ip" {
  description = "Web Server Public IP"
  value       = aws_instance.web-server.public_ip
}
