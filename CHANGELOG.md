
## 1.0.0-rc2 (Unreleased)

BACKWARDS INCOMPATIBILITIES / NOTES:

  * Change `bastion_ip` output to `bastion_primaryip`. 
  * Change `ssh_client_access` variable to `client_access`.
  * Remove `role_tag_value` variable and `bastion_role_tag` output.

IMPROVEMENTS:

  * Add `bastion_address` output.
  * Add `cns_fqdn_base` variable to allow customization of CNS names.
  * Change firewall rules to rely on CNS service names instead of (now removed) `role` tag.
  
## 1.0.0-rc1 (2018-02-10)

  * Initial working example
