resource "aws_s3_object" "bronze-folder" {
  bucket = aws_s3_bucket.ingestion_bucket.id
  key    = "bronze-layer/"
}
resource "aws_s3_object" "silver-folder" {
  bucket = aws_s3_bucket.ingestion_bucket.id
  key    = "silver-layer/"
}
resource "aws_s3_object" "gold-folder" {
  bucket = aws_s3_bucket.ingestion_bucket.id
  key    = "gold-layer/"
}