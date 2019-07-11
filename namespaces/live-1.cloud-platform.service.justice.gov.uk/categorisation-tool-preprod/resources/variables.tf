variable "application" {
  default = "categorisation-tool"
}

variable "namespace" {
  default = "categorisation-tool-preprod"
}

variable "business-unit" {
  description = "Area of the MOJ responsible for the service."
  default     = "HMPPS"
}

variable "team_name" {
  description = "The name of your development team"
  default     = "DPS"
}

variable "environment-name" {
  description = "The type of environment you're deploying to."
  default     = "preprod"
}

variable "infrastructure-support" {
  description = "The team responsible for managing the infrastructure. Should be of the form team-email."
  default     = "michael.willis@digtal.justice.gov.uk"
}

variable "is-production" {
  default = "false"
}
