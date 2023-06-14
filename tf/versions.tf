# config terraform provider version
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.68.0"
    }
  }

  backend "gcs" {
    bucket                      = "tdshop-data-internal-tf-states"
    prefix                      = "terraform/pradit"
    impersonate_service_account = "terraform@tdshop-data-internal.iam.gserviceaccount.com"
  }
}
