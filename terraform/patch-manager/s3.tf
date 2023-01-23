resource "aws_s3_bucket" "patch-bucket" {
  bucket = "cloudbeard-patch-bucket"
}

resource "aws_s3_bucket_acl" "patch-bucket-acl" {
  bucket = aws_s3_bucket.patch-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "patch-bucket-encryption" {
  bucket = aws_s3_bucket.patch-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
