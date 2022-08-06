locals {}

###############################################
# Provision documentation
###############################################
data "netbox_cluster" "this" {
  name = var.cluster.name
}

resource "netbox_ip_address" "this" {
  dns_name     = var.name
  interface_id = netbox_interface.this.id
  ip_address   = var.ip
  status       = "reserved"
}

resource "netbox_interface" "this" {
  name               = "eth0"
  virtual_machine_id = netbox_virtual_machine.this.id
}

resource "netbox_virtual_machine" "this" {
  cluster_id = data.netbox_cluster.this.id
  name       = var.name

  disk_size_gb = var.disk_size
  memory_mb    = var.memory_size
  vcpus        = var.cpus
}


###############################################
# Provision machine
###############################################
resource "nutanix_virtual_machine" "this" {
  name         = var.name
  cluster_uuid = var.cluster.metadata.uuid

  num_vcpus_per_socket = var.cpus
  num_sockets          = 1
  memory_size_mib      = var.memory_size

  disk_list {
    disk_size_mib = var.disk_size * 1000
  }
  enable_cpu_passthrough = true
}

###############################################
# Provision monitoring
###############################################

#Grafana

#Telegraf
