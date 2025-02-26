# Create billing admins group
resource "google_cloud_identity_group" "billing_admins_group" {
  display_name = "Billing Administrators"
  parent       = "customers/${var.customer_id}"
  group_key {
    id = "billing-admins@${var.domain}"
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_organization_iam_member" "billing_admin_role" {
  org_id = var.organization_id # Replace with your GCP organization ID
  role   = "roles/billing.admin"   # Billing Account Administrator
  member = "group:${google_cloud_identity_group.billing_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "billing_creator_role" {
  org_id = var.organization_id
  role   = "roles/billing.creator"  # Billing Account Creator
  member = "group:${google_cloud_identity_group.billing_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_viewer_role" {
  org_id = var.organization_id
  role   = "roles/resourcemanager.organizationViewer"  # Organization Viewer
  member = "group:${google_cloud_identity_group.billing_admins_group.group_key[0].id}"
}

# Add users to the group
resource "google_cloud_identity_group_membership" "billing-admin-kamal" {
  group    = google_cloud_identity_group.billing_admins_group.id
  preferred_member_key {
    id = "kamal@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "billing-admin-raffiek" {
  group    = google_cloud_identity_group.billing_admins_group.id
  preferred_member_key {
    id = "raffiek@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "billing-admin-zhafri" {
  group    = google_cloud_identity_group.billing_admins_group.id
  preferred_member_key {
    id = "zhafri@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}