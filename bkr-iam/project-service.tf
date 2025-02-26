resource "google_project_service" "cloudidentity" {
    project            = "prj-dso3-web-poc"
    service            = "cloudidentity.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "iam" {
    project            = "prj-dso3-web-poc"
    service            = "iam.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "cloudresourcemanager" {
    project            = "prj-dso3-web-poc"
    service            = "cloudresourcemanager.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "billing" {
    project            = "prj-dso3-web-poc"
    service            = "billingbudgets.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "compute" {
    project            = "prj-dso3-web-poc"
    service            = "compute.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "logging" {
    project            = "prj-dso3-web-poc"
    service            = "logging.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "securitycenter" {
    project            = "prj-dso3-web-poc"
    service            = "securitycenter.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

resource "google_project_service" "container" {
    project            = "prj-dso3-web-poc"
    service            = "container.googleapis.com"
    disable_on_destroy = false
#    depends_on = [google_project_service.service_usage]
}

