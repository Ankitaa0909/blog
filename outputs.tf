output "Bastion_Public_IP" {
  value = aws_instance.bastion.public_ip
}

output "Application_Private_IP" {
  value = aws_instance.application.private_ip
}

output "Database_Private_IP" {
  value = aws_instance.database.private_ip
}
