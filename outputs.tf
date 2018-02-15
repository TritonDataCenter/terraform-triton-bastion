#
# Outputs
#
output "bastion_primary_ip" {
  value = ["${triton_machine.bastion.*.primaryip}"]
}

output "bastion_user" {
  value = "${var.user}"
}

output "bastion_public_address" {
  value = "${local.bastion_public_address}"
}

output "bastion_cns_service_name" {
  value = "${var.cns_service_name}"
}
