#Create security admins group
resource "google_cloud_identity_group" "security_admins_group" {
  display_name = "Security Administrators"
  parent       = "customers/${var.customer_id}"
  group_key {
    id = "security-admins@${var.domain}"
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_organization_iam_member" "org_policy_admin" {
  org_id   = var.organization_id
  role     = "roles/orgpolicy.policyAdmin"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "security_reviewer" {
  org_id   = var.organization_id
  role     = "roles/iam.securityReviewer"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "security_center_admin" {
  org_id   = var.organization_id
  role     = "roles/securitycenter.admin"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "folder_iam_admin" {
  org_id   = var.organization_id
  role     = "roles/resourcemanager.folderIamAdmin"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "private_logs_viewer" {
  org_id   = var.organization_id
  role   = "roles/logging.privateLogViewer"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "logs_config_writer" {
  org_id   = var.organization_id
  role   = "roles/logging.configWriter"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "kube_viewer" {
  org_id   = var.organization_id
  role   = "roles/container.viewer"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "compute_viewer"{
  org_id   = var.organization_id
  role   = "roles/compute.viewer"
  member   = "group:${google_cloud_identity_group.security_admins_group.group_key[0].id}"
}

# Add users to the group
resource "google_cloud_identity_group_membership" "security-admin-kamal" {
  group    = google_cloud_identity_group.security_admins_group.id
  preferred_member_key {
    id = "kamal@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "security-admin-raffiek" {
  group    = google_cloud_identity_group.security_admins_group.id
  preferred_member_key {
    id = "raffiek@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "security-admin-zhafri" {
  group    = google_cloud_identity_group.security_admins_group.id
  preferred_member_key {
    id = "zhafri@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}