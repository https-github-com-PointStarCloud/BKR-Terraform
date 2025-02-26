variable "project_id" {
  description = "The ID of the Project"
  type        = string
  default     = "prj-dso3-web-poc"
}

variable "region" {
  description = "Region"
  type        = string
  default     = "asia-southeast1"
}

variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
  default     = "017D43-1254EC-2E999C" ## Billing ID
}

variable "organization_id" {
  description = "The organization id for the associated resources"
  type        = string
  default     = "1011666679277"
}
variable "domain" {
  description = "The domain for the Google Group"
  type        = string
  default     = "dso-three.online"
}

variable "customer_id" {
  description = "The customer ID for the Google Identity"
  type        = string
  default     = "C01rw8icy"
}

variable "billing_admins" {
  description = "List of billing admin members"
  type        = list(string)
  default     = [
    "user:zhafri@dso-three.online",
    "user:kamal@dso-three.online",
    "user:raffiek@dso-three.online"
    ]
}

variable "network_admins" {
  description = "List of network admin members"
  type        = list(string)
  default     = [
    "user:zhafri@dso-three.online",
    "user:kamal@dso-three.online",
    "user:raffiek@dso-three.online"
    ]
}

variable "logging_admins" {
  description = "List of logging admin members"
  type        = list(string)
  default     = [
    "user:zhafri@dso-three.online",
    "user:kamal@dso-three.online",
    "user:raffiek@dso-three.online"
    ]
}

variable "security_admins" {
  description = "List of security admin members"
  type        = list(string)
  default     = [
    "user:zhafri@dso-three.online",
    "user:kamal@dso-three.online",
    "user:raffiek@dso-three.online"
    ]
}

