#Create project
resource "google_project" "prj-web-poc" {
  name       = "prj-web-poc"
  project_id = "prj-dso3-web-poc"
  folder_id  = google_folder.fldr-web-poc.name
  billing_account = var.billing_account
}

#Enable Service Usage API
resource "google_project_service" "service_usage" {
    project            = "prj-dso3-web-poc"
    service            = "serviceusage.googleapis.com"
    disable_on_destroy = false
}

