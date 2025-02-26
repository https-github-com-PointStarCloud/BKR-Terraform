#Create 1st level folder
resource "google_folder" "fldr-web" {
  display_name = "fldr-web"
  parent       = "organizations/${var.organization_id}"
}

#Create 2nd level folder
resource "google_folder" "fldr-web-poc" {
  display_name = "fldr-web-poc"
  parent       = google_folder.fldr-web.name
}