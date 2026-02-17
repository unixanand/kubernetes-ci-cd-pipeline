# -------------------------
# Outputs
# -------------------------
output "Jenkins_Server_Public_Ip" {
  value = aws_instance.jenkins_server.public_ip
}

resource "aws_s3_bucket" "kops_state" {
  bucket = "devops-proj1-kops-state-bucket-unique"
}
