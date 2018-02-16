#
# Outputs
#
output "bastion_user" {
  value = "${module.bastion.bastion_user}"
}

output "bastion_address" {
  value = "${module.bastion.bastion_address}"
}
