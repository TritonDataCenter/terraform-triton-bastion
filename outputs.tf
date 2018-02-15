#
# Outputs
#
output "bastion_primaryip" {
  value = ["${triton_machine.bastion.*.primaryip}"]
}

output "bastion_user" {
  value = "${var.user}"
}

output "bastion_address" {
  value = "${local.bastion_address}"
}

output "bastion_cns_service_name" {
  value = "${var.cns_service_name}"
}
