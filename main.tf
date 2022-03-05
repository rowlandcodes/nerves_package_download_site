module "s3_bucket" {
  source = "./s3"

  bucket_name = var.bucket_name
}

module "iam_circle_ci" {
  source = "./iam"

  circle_ci_user_name   = var.circle_ci_user_name
  circle_ci_group_name  = var.circle_ci_group_name
  circle_ci_policy_name = var.circle_ci_policy_name
  bucket_name           = var.bucket_name
}
