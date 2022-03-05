output "bucket_url" {
  value = "http://${module.s3_bucket.s3_bucket_url}"
}

output "bucket_uri" {
  value = "s3://${var.bucket_name}"
}

output "circle_ci_access_key" {
  value = module.iam_circle_ci.circle_ci_access_key
}

output "circle_ci_secret_access_key" {
  value     = module.iam_circle_ci.circle_ci_secret_access_key
  sensitive = true
}
