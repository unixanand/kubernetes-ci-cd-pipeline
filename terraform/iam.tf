# -------------------------
# IAM Role for Jenkins EC2
# -------------------------
resource "aws_iam_role" "jenkins_ec2_role" {
  name = "jenkins-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# -------------------------
# IAM Policy (kops + S3 access)
# -------------------------
resource "aws_iam_policy" "jenkins_kops_policy" {
  name        = "jenkins-kops-policy"
  description = "Permissions for kops to access S3, EC2, Route53, AutoScaling"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:*",
          "ec2:Describe*",
          "autoscaling:*",
          "route53:*"
        ],
        Resource = "*"
      }
    ]
  })
}

# -------------------------
# Attach policy to role
# -------------------------
resource "aws_iam_role_policy_attachment" "jenkins_attach" {
  role       = aws_iam_role.jenkins_ec2_role.name
  policy_arn = aws_iam_policy.jenkins_kops_policy.arn
}

# -------------------------
# IAM Instance Profile
# -------------------------
resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins-instance-profile"
  role = aws_iam_role.jenkins_ec2_role.name
}
