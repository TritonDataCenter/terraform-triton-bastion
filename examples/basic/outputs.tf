#
# Outputs
#
output "bastion_ip" {
  value = ["${module.bastion.bastion_ip}"]
}

output "bastion_user" {
  value = ["${module.bastion.bastion_user}"]
}
