resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  versioning {
    enabled    = var.enable_versioning
  }

  dynamic "logging" {
    count = var.access_logging ? 1 : 0
    content {
      target_bucket = var.access_logging_bucket
      target_prefix = "log/${var.bucket_name}"
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}
