resource "aws_s3_bucket" "s3_bucket_web_app" {
  bucket = var.bucket_name
 

}
resource "aws_s3_bucket_acl" "web_app_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket_web_app.id
  acl    = "private"
}
resource "aws_s3_object" "s3_bucket_object_web_app" {
  bucket = aws_s3_bucket.s3_bucket_web_app.id
  key    = "beanstalk/webapp.war"
  source = "application/web_app.war"
}
