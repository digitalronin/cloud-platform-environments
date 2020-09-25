package main

valid_namespace := {
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "how-out-of-date-are-we",
    "labels": {
      "cloud-platform.justice.gov.uk/is-production": "false",
      "cloud-platform.justice.gov.uk/environment-name": "development"
    },
    "annotations": {
      "cloud-platform.justice.gov.uk/business-unit": "MoJ Digital",
      "cloud-platform.justice.gov.uk/application": "Cloud Platform How Out Of Date Are We",
      "cloud-platform.justice.gov.uk/owner": "Cloud Platform: platforms@digital.justice.gov.uk",
      "cloud-platform.justice.gov.uk/source-code": "https://github.com/ministryofjustice/cloud-platform-how-out-of-date-are-we",
      "cloud-platform.justice.gov.uk/slack-channel": "cloud-platform"
    }
  }
}

test_ok {
  true
}

# test_fail {
#   false
# }

test_allow_valid_namespace {
  not deny with input as valid_namespace
}
