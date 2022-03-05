resource "aws_s3_bucket" "package_download_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "package_download_bucket" {
  bucket = aws_s3_bucket.package_download_bucket.id
  acl    = "public-read"
}

output "s3_bucket_url" {
  value = aws_s3_bucket.package_download_bucket.bucket_domain_name
}
