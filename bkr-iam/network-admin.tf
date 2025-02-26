#Create network admins group
resource "google_cloud_identity_group" "network_admins_group" {
  display_name = "Networking Administrators"
  parent       = "customers/${var.customer_id}"
  group_key {
    id = "network-admins@${var.domain}"
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_organization_iam_member" "compute_network_admin" {
  org_id = var.organization_id 
  role   = "roles/compute.networkAdmin"
  member = "group:${google_cloud_identity_group.network_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "compute_shared_vpc_admin" {
  org_id = var.organization_id
  role   = "roles/compute.xpnAdmin"
  member = "group:${google_cloud_identity_group.network_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "compute_security_admin" {
  org_id = var.organization_id
  role   = "roles/compute.securityAdmin"
  member = "group:${google_cloud_identity_group.network_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "folder_viewer" {
  org_id = var.organization_id
  role   = "roles/resourcemanager.folderViewer"
  member = "group:${google_cloud_identity_group.network_admins_group.group_key[0].id}"
}

# Add users to the group
resource "google_cloud_identity_group_membership" "network-admin-kamal" {
  group    = google_cloud_identity_group.network_admins_group.id
  preferred_member_key {
    id = "kamal@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "network-admin-raffiek" {
  group    = google_cloud_identity_group.network_admins_group.id
  preferred_member_key {
    id = "raffiek@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "network-admin-zhafri" {
  group    = google_cloud_identity_group.network_admins_group.id
  preferred_member_key {
    id = "zhafri@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}