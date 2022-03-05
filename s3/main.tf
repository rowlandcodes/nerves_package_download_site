resource "aws_s3_bucket" "package_download_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "package_download_bucket" {
  bucket = aws_s3_bucket.package_download_bucket.id
  acl    = "public"
}
