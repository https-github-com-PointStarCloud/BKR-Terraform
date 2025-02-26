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