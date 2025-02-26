#Create logging admins group
resource "google_cloud_identity_group" "logging_admins_group" {
  display_name = "Logging Administrators"
  parent       = "customers/${var.customer_id}"
  group_key {
    id = "logging-admins@${var.domain}"
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_organization_iam_member" "logging_admin" {
  org_id = var.organization_id 
  role   = "roles/logging.admin"
  member = "group:${google_cloud_identity_group.logging_admins_group.group_key[0].id}"
}

# Add users to the group
resource "google_cloud_identity_group_membership" "logging-admin-kamal" {
  group    = google_cloud_identity_group.logging_admins_group.id
  preferred_member_key {
    id = "kamal@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "logging-admin-raffiek" {
  group    = google_cloud_identity_group.logging_admins_group.id
  preferred_member_key {
    id = "raffiek@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "logging-admin-zhafri" {
  group    = google_cloud_identity_group.logging_admins_group.id
  preferred_member_key {
    id = "zhafri@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}