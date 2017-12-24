#
# Data Sources
#
data "triton_image" "ubuntu" {
  name        = "ubuntu-16.04"
  type        = "lx-dataset"
  most_recent = true
}

data "triton_network" "public" {
  name = "Joyent-SDC-Public"
}

data "triton_network" "private" {
  name = "My-Fabric-Network"
}

#
# Modules
#
module "bastion" {
  source = "../../"

  name    = "bastion-basic-example"
  package = "g4-general-4G"
  image   = "${data.triton_image.ubuntu.id}"

  networks = [
    "${data.triton_network.public.id}",
    "${data.triton_network.private.id}",
  ]

  machine_count = "2"
}
