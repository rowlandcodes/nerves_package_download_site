resource "aws_iam_user" "circle_ci" {
  name = var.circle_ci_user_name
}

resource "aws_iam_group" "circle_ci_group" {
  name = var.circle_ci_group_name
}

resource "aws_iam_user_group_membership" "circle_ci" {
  user = aws_iam_user.circle_ci.name

  groups = [
    aws_iam_group.circle_ci_group.name,
  ]
}

resource "aws_iam_access_key" "circle_ci_access_key" {
  user = aws_iam_user.circle_ci.name
}

resource "aws_iam_policy" "circle_ci_policy" {
  name = var.circle_ci_policy_name
  policy = <<EOF
{ 
  "Version": "2012-10-17", 
  "Statement": [ 
    { 
      "Sid": "s3", 
      "Effect": "Allow", 
      "Action": "s3:*", 
      "Resource": [ "arn:aws:s3:::${var.bucket_name}" ] 
    } 
  ] 
} 
EOF
}

resource "aws_iam_group_policy_attachment" "circle_ci_group_policy_attachment" {
  group = aws_iam_group.circle_ci_group.name
  policy_arn = aws_iam_policy.circle_ci_policy.arn
}

output "circle_ci_access_key" {
  value = aws_iam_access_key.circle_ci_access_key.id
}

output "circle_ci_secret_access_key" {
  value = aws_iam_access_key.circle_ci_access_key.secret
}
