#
# Outputs
#
output "bastion_primary_ip" {
  value = ["${module.bastion.bastion_primary_ip}"]
}

output "bastion_user" {
  value = ["${module.bastion.bastion_user}"]
}

output "bastion_public_address" {
  value = "${module.bastion.bastion_public_address}"
}

output "bastion_cns_service_name" {
  value = "${module.bastion.bastion_cns_service_name}"
}
