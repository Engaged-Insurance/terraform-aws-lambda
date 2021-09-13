# Create S3 Bucket -> Create a zip file w/ local source -> Upload archive

resource "aws_s3_bucket" "lambda_bucket" {
  bucket_prefix = "tf-lambda-"

  acl           = "private"
  force_destroy = true

  tags = {
    Name = var.function_name
  }
}

data "archive_file" "lambda_zip" {
  type = "zip"

  source_dir  = "${path.root}/src"
  output_path = "${path.root}/src.zip"
}

resource "aws_s3_bucket_object" "lambda" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "${var.function_name}.zip"
  source = data.archive_file.lambda_zip.output_path

  etag = filemd5(data.archive_file.lambda_zip.output_path)
}
