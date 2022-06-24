resource "aws_s3_bucket_logging" "example" {
  count  = var.access_logging ? 1 : 0
  bucket = aws_s3_bucket.this.id

  target_bucket = var.access_logging_bucket
  target_prefix = "log/${var.bucket_name}"
}
