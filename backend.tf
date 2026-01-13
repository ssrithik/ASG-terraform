terraform {
  backend "s3" {
    bucket = "rithik-terraform-backend-state"
    key    = "asg/terraform.tfstate"
    region = "us-east-1"
  }
}
