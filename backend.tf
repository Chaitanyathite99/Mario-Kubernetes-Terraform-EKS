terraform {
  backend "s3" {
    bucket         = "amzn-s3-mario-game-devops-2"  # Ensure this is your actual S3 bucket
    key            = "eks/terraform.tfstate"  # Standardized directory naming
    region         = "sa-east-1"  # Changed to match provider region
    encrypt        = true  # Ensures state file is encrypted
    dynamodb_table = "terraform-lock"  # Enables state locking to prevent conflicts
  }
}
