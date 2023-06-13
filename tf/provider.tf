
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "current" {
  provider = google
}

provider "google" {
  alias                       = "impersonation"
  project                     = data.google_client_config.current.project
  region                      = data.google_client_config.current.region
  impersonate_service_account = var.terraform_service_account
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
}

data "google_service_account_access_token" "terraform_sa" {
  provider               = google.impersonation
  target_service_account = var.terraform_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "1200s"
}

# /******************************************
#   GA Provider configuration
#  *****************************************/
# ## Provider for Network management
# ## Provider for GKE management
# ## Provider for BigQuery management
# ## Provider for IAM management

provider "google" {
  alias        = "tf"
  project      = data.google_client_config.current.project
  region       = data.google_client_config.current.region
  zone         = data.google_client_config.current.zone
  access_token = data.google_service_account_access_token.terraform_sa.access_token
}
