resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  tags = {
    Name = var.s3_name_tag
  }
}
resource "aws_iam_role" "s3_full_access" {
  name = "s3_full_access"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "s3_full_access" {
  role       = aws_iam_role.s3_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = aws_iam_role.s3_full_access.name
}
