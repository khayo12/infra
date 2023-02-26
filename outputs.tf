output "security_grp_id" {
  description = "securitygrp-id"
  value       = aws_security_group.ec2-sg.id
}
output "instance_ids" {
  description = "id"
  value       = ["${aws_instance.terraforminstance.*.id}"]
}
output "instance_states" {
  description = "state"
  value       = ["${aws_instance.terraforminstance.*.instance_state}"]
}
output "public_dns" {
  description = "public-dns"
  value       = ["${aws_instance.terraforminstance.*.public_dns}"]
}
output "public_ips" {
  description = "public-ip"
  value       = ["${aws_instance.terraforminstance.*.public_ip}"]
}
output "instance_arns" {
  description = "arn"
  value       = ["${aws_instance.terraforminstance.*.arn}"]
}
output "keyname" {
  description = "keyname"
  value       = ["${aws_instance.terraforminstance.*.key_name}"]
}