locals {}


###############################################
# Create organizational resources
###############################################
resource "netbox_region" "southern_california" {
  name = "Southern California"
  slug = "socal"
}

resource "netbox_site" "demo_el_centro" {
  name      = "el_centro"
  region_id = netbox_region.southern_california.id
}

resource "netbox_location" "emc" {
  name    = "EMC"
  site_id = netbox_site.demo_el_centro.id
}


###############################################
# Create device infra resources
###############################################

resource "netbox_device_role" "hypervisor" {
  name      = "Hypervisor"
  color_hex = "00f7ff"
}

resource "netbox_manufacturer" "kvm" {
  name = "kvm"
}

resource "netbox_device_type" "hypervisor" {
  model           = "Hypervisor"
  manufacturer_id = netbox_manufacturer.kvm.id
}

###############################################
# Create hypervisor infrastructure
###############################################

resource "netbox_cluster_group" "emc" {
  name = "emc"
}

resource "netbox_cluster_type" "nutanix_ce" {
  name = "Nutanix Community Edition"
  slug = "nutanix-community-edition"
}

resource "netbox_cluster" "emc_1" {
  cluster_group_id = netbox_cluster_group.emc.id
  cluster_type_id  = netbox_cluster_type.nutanix_ce.id
  name             = data.nutanix_cluster.demo.name
}

resource "netbox_device" "demo" {
  count = length(data.nutanix_hosts.demo.entities)

  name     = data.nutanix_hosts.demo.entities[count.index].name
  serial   = data.nutanix_hosts.demo.entities[count.index].serial_number
  comments = <<EOT
## Management:
- [Controller VM](https://${data.nutanix_hosts.demo.entities[count.index].controller_vm.ip}:9440)

## Runbooks:
- [Sample Runbook](https://docs.nutanix.com/display/DOC/Nutanix+Virtualization+Platform+Runbooks)

This was generated automatically with Terraform. Do not edit manually. <link to github>
EOT

  device_type_id = netbox_device_type.hypervisor.id
  role_id        = netbox_device_role.hypervisor.id
  site_id        = netbox_site.demo_el_centro.id
}


###############################################
# Create IP infrastructure
###############################################

resource "netbox_ip_range" "demo" {
  start_address = "192.168.20.80/24"
  end_address   = "192.168.20.90/24"
}
