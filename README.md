# Triton Bastion Terraform Module

A Terraform module to create bastion machine(s) for [Joyent's Triton Compute service](https://www.joyent.com/triton/compute).

## Usage

```hcl
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

module "bastion" {
  source = "github.com/joyent/terraform-triton-bastion"

  name    = "bastion-basic-example"
  package = "g4-general-4G"
  image   = "${data.triton_image.ubuntu.id}"

  networks = [
    "${data.triton_network.public.id}",
    "${data.triton_network.private.id}",
  ]

  machine_count  = "2"
}
```

## Examples
- [basic](examples/basic)

## Resources created

- [`triton_machine.bastion`](https://www.terraform.io/docs/providers/triton/r/triton_machine.html): The bastion machine(s).
- [`triton_firewall_rule.ssh.*`](https://www.terraform.io/docs/providers/triton/r/triton_firewall_rule.html): The firewall rule(s) allowing SSH access to the bastion machine(s).
