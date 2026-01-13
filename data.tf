data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "rithik-terraform-backend-state"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "elb" {
  backend = "s3"

  config = {
    bucket = "rithik-terraform-backend-state"
    key    = "elb/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "lt" {
  backend = "s3"

  config = {
    bucket = "rithik-terraform-backend-state"
    key    = "launch-template/terraform.tfstate"
    region = "us-east-1"
  }
}
