provider "pingdom" {}

locals {
  forms = {
    cica                   = "www.gov.uk/claim-compensation-criminal-injury/victim-lived-with-attacker-before-october-1979",
    childrens-funeral-fund = "claim-for-costs-of-a-childs-funeral.form.service.justice.gov.uk",
    hmcts-complaints       = "complain-about-a-court-or-tribunal.form.service.justice.gov.uk",
    leavers-form           = "leavers.form.service.justice.gov.uk",
    contact-us-form        = "contact.form.service.justice.gov.uk"
  }
  names = keys(local.forms)
  hosts = values(local.forms)
}

resource "pingdom_check" "fb_services_pingdom" {
  count                    = length(local.forms)
  type                     = "http"
  name                     = "Form Builder - ${local.names[count.index]}"
  host                     = local.hosts[count.index]
  resolution               = 1
  notifywhenbackup         = true
  sendnotificationwhendown = 6
  notifyagainevery         = 0
  url                      = "/ping.json"
  encryption               = true
  port                     = 443
  tags                     = local.names[count.index]
  probefilters             = "region:EU"
  integrationids           = [100321]
}