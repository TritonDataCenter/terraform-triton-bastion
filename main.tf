#
# Terraform/Providers
#
terraform {
  required_version = ">= 0.11.0"
}

#
# Data sources
#
data "triton_datacenter" "current" {}

data "triton_account" "current" {}

#
# Locals
#
locals {
  bastion_address = "${var.cns_service_name}.svc.${data.triton_account.current.id}.${data.triton_datacenter.current.name}.${var.cns_fqdn_base}"
}

#
# Resources
#
resource "triton_machine" "bastion" {
  count = "${var.machine_count}"

  name    = "${var.name}-bastion-${count.index}"
  package = "${var.package}"
  image   = "${var.image}"

  firewall_enabled = true

  networks = ["${var.networks}"]

  cns {
    services = ["${var.cns_service_name}"]
  }
}

resource "triton_firewall_rule" "ssh" {
  count = "${length(var.client_access)}"

  rule        = "FROM ${var.client_access[count.index]} TO tag \"triton.cns.services\" = \"${var.cns_service_name}\" ALLOW tcp PORT 22"
  enabled     = true
  description = "${var.name} - Allow access from clients to Bastion servers."
}
