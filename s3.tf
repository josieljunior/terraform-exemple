
resource "aws_s3_bucket" "dev4" {
  bucket = "bucket-dev4"
  acl    = "private"

  tags = {
    Name        = "bucket-dev4"
  }
}