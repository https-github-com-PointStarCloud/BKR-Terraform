#Create organization admins group
resource "google_cloud_identity_group" "org_admins_group" {
  display_name = "Organization Administrators"
  parent       = "customers/${var.customer_id}"
  group_key {
    id = "org-admins@${var.domain}"
  }
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_organization_iam_member" "org_admins_group_organization_admin" {
  org_id   = var.organization_id
  role     = "roles/resourcemanager.organizationAdmin"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_folder_admin" {
  org_id   = var.organization_id
  role     = "roles/resourcemanager.folderAdmin"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_project_creator" {
  org_id   = var.organization_id
  role     = "roles/resourcemanager.projectCreator"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

# Organization Administrators Group - Network Role
resource "google_organization_iam_member" "org_admins_group_shared_vpc_admin" {
  org_id   = var.organization_id
  role     = "roles/compute.xpnAdmin" # Shared VPC Admin equivalent
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_billing_user" {
  org_id   = var.organization_id
  role     = "roles/billing.user"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_org_policy_admin" {
  org_id   = var.organization_id
  role     = "roles/orgpolicy.policyAdmin"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_security_center_admin" {
  org_id   = var.organization_id
  role     = "roles/securitycenter.admin"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

resource "google_organization_iam_member" "org_admins_group_support_admin" {
  org_id   = var.organization_id
  role     = "roles/cloudsupport.admin"
  member   = "group:${google_cloud_identity_group.org_admins_group.group_key[0].id}"
}

# Add users to the group
resource "google_cloud_identity_group_membership" "org-admin-kamal" {
  group    = google_cloud_identity_group.org_admins_group.id
  preferred_member_key {
    id = "kamal@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "org-admin-raffiek" {
  group    = google_cloud_identity_group.org_admins_group.id
  preferred_member_key {
    id = "raffiek@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}

resource "google_cloud_identity_group_membership" "org-admin-zhafri" {
  group    = google_cloud_identity_group.org_admins_group.id
  preferred_member_key {
    id = "zhafri@dso-three.online"
  }
  roles {
    name = "MEMBER"
  }
}