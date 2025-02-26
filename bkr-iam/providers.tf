provider "google" {
  project = var.project_id
  billing_project = var.project_id
  region  = var.region
  user_project_override = true
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
  required_version = ">= 0.13"
}