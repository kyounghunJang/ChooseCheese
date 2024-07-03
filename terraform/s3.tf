resource "aws_s3_bucket" "capstone_bucket_original" {
  bucket = "capstone-bucket-original"
  tags = {
    Name        = "Capstone"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "capstone_bucket_diffusion" {
  bucket = "capstone-bucket-diffusion"

  tags = {
    Name        = "Capstone"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "capstone_bucket_smile_score" {
  bucket = "capstone-bucket-smile"

  tags = {
    Name        = "Capstone"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "capstone_bucket_pdb" {
  bucket = "capstone-bucket-pdb"

  tags = {
    Name        = "Capstone"
    Environment = "Dev"
  }
}