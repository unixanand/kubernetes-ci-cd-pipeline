# -------------------------
# Outputs
# -------------------------
output "Jenkins_Server_Public_Ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "kops_state_bucket" {
  value = aws_s3_bucket.kops_state.id
}
