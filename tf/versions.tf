# config terraform provider version
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.68.0"
    }
  }
}
