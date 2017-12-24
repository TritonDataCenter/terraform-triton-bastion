#
# Outputs
#
output "bastion_ip" {
  value = ["${triton_machine.bastion.*.primaryip}"]
}

output "bastion_user" {
  value = "${var.user}"
}

output "bastion_role_tag" {
  value = "${var.role_tag_value}"
}

output "bastion_cns_service_name" {
  value = "${var.cns_service_name}"
}
