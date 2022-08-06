###############################################
# Create infra resources
###############################################

module "docker" {
  source = "./modules/host"

  cluster = data.nutanix_cluster.demo
  ip      = "192.168.20.80/24"
  name    = "docker-host"
  tags    = ["terraform", "docker", netbox_cluster.emc_1.name]
}

module "steven_bs" {
  source = "./modules/host"

  cluster = data.nutanix_cluster.demo
  ip      = "192.168.20.82/24"
  name    = "steven-bullshit"
  tags    = ["terraform", "docker", netbox_cluster.emc_1.name]
}

/* module "other-node" {
  source = "./modules/host"

  cluster = data.nutanix_cluster.demo
  ip      = "192.168.20.81/24"
  name    = "other-node"
  tags    = ["terraform", "docker", netbox_cluster.emc_1.name]
}
 */
