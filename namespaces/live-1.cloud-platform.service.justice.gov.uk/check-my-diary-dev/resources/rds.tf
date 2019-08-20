/*
 * When using this module through the cloud-platform-environments, the following
 * two variables are automatically supplied by the pipeline.
 */

variable "cluster_name" {}
variable "cluster_state_bucket" {}

module "checkmydiary_dev_rds" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-rds-instance?ref=4.5"

  cluster_name           = "${var.cluster_name}"
  cluster_state_bucket   = "${var.cluster_state_bucket}"
  db_allocated_storage   = "20"
  db_instance_class      = "db.t2.small"
  db_iops                = "1000"
  team_name              = "check-my-diary"
  business-unit          = "HMPPS"
  application            = "check-my-diary"
  is-production          = "false"
  environment-name       = "development"
  infrastructure-support = "checkmydiary@digital.justice.gov.uk"
  rds_family             = "postgres10"
}

resource "kubernetes_secret" "checkmydiary_dev_rds" {
  metadata {
    name      = "check-my-diary-rds-dev"
    namespace = "check-my-diary-dev"
  }

  data {
    rds_instance_endpoint = "${module.checkmydiary_dev_rds.rds_instance_endpoint}"
    database_name         = "${module.checkmydiary_dev_rds.database_name}"
    database_username     = "${module.checkmydiary_dev_rds.database_username}"
    database_password     = "${module.checkmydiary_dev_rds.database_password}"
    rds_instance_address  = "${module.checkmydiary_dev_rds.rds_instance_address}"
  }
}
