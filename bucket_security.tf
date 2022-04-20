resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.bucket_public_acl != false ? "private" : "public"
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  restrict_public_buckets = var.restrict_public_buckets
  ignore_public_acls      = var.ignore_public_acls
}
