resource "aws_iam_policy" "ec2_instance_profile" {
  name        = "ec2_instance_profile"
  path        = "/"
  description = "assumed app ec2 role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2024-01-29"
    Statement = [
      {
        Action = [
           "rds:*", 
            "application-autoscaling:*",
            "ec2:DescribeVpcs",
            "ec2:DescribeSubnets",
            "ec2:DescribeSecurityGroups",
            "iam:GetRole",
            "iam:ListRoles",
            "kms:DescribeKey",
            "kms:ListAliases"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}