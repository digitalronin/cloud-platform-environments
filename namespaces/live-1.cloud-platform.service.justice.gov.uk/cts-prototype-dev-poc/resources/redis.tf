################################################################################
# Track a Query (Correspondence Tool Staff)
# Application Elasticache for ReDiS (for sidekiq background job processing)
#################################################################################

module "track_a_query_elasticache_redis" {
  source                 = "github.com/ministryofjustice/cloud-platform-terraform-elasticache-cluster?ref=3.1"
  cluster_name           = "${var.cluster_name}"
  cluster_state_bucket   = "${var.cluster_state_bucket}"
  team_name              = "correspondence"
  business-unit          = "Central Digital"
  application            = "track-a-query"
  is-production          = "false"
  environment-name       = "development"
  infrastructure-support = "mohammed.seedat@digtal.justice.gov.uk"

  providers = {
    aws = "aws.london"
  }
}

resource "kubernetes_secret" "track_a_query_elasticache_redis" {
  metadata {
    name      = "track-a-query-elasticache-redis-output"
    namespace = "cts-prototype-dev-poc"
  }

  data {
    primary_endpoint_address = "redis://${module.track_a_query_elasticache_redis.primary_endpoint_address}:6379"
    auth_token               = "${module.track_a_query_elasticache_redis.auth_token}"
  }
}