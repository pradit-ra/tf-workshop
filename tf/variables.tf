variable "project_id" {
  type    = string
  default = "tdshop-data-internal"
}

variable "region" {
  default = "asia-southeast1"
}

variable "zone" {
  default = "asia-southeast1-a"
}

variable "terraform_service_account" {
  type    = string
  default = "terraform@tdshop-data-internal.iam.gserviceaccount.com"
}

variable "prefix" {
  default = "pradit"
}
