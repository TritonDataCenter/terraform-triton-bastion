#
# Terraform/Providers
#
terraform {
  required_version = ">= 0.11.0"
}

provider "triton" {
  version = ">= 0.4.0"
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

  tags {
    role = "${var.role_tag_value}"
  }

  cns {
    services = ["${var.cns_service_name}"]
  }
}

resource "triton_firewall_rule" "ssh" {
  count = "${length(var.ssh_client_access)}"

  rule        = "FROM ${var.ssh_client_access[count.index]} TO tag \"role\" = \"${var.role_tag_value}\" ALLOW tcp PORT 22"
  enabled     = true
  description = "${var.name} - Allow access from clients to Bastion servers."
}
