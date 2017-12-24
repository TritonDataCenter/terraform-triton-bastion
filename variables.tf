#
# Variables
#
variable "name" {
  description = "The name of the environment."
  type        = "string"
}

variable "image" {
  description = "The image to deploy as the Bastion machines(s)."
  type        = "string"
}

variable "package" {
  description = "The package to deploy as the Bastion machines(s)."
  type        = "string"
}

variable "networks" {
  description = "The networks to deploy the Bastion machines(s) within."
  type        = "list"
}

variable "machine_count" {
  description = "The number of Bastion machines to provision."
  type        = "string"
  default     = "1"
}

variable "user" {
  description = <<EOF
The Bastion user to use for provisioning. This is a pass-through variable.
Setting this will NOT change any part of provisioning.
EOF

  type    = "string"
  default = "root"
}

variable "ssh_client_access" {
  description = <<EOF
'From' targets to allow clients to access the Bastion machines' ssh port - i.e. access from other VMs or public internet.
See https://docs.joyent.com/public-cloud/network/firewall/cloud-firewall-rules-reference#target
for target syntax.
EOF

  type    = "list"
  default = ["any"]
}

variable "role_tag_value" {
  description = "The 'role' tag value allow access FROM the Bastion machine(s) TO other machines."
  type        = "string"
}

variable "cns_service_name" {
  description = "The Bastion CNS service name. Note: this is the service name only, not the full CNS record."
  type        = "string"
  default     = "bastion"
}
