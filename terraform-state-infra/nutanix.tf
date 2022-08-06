locals {}
###############################################
# Get data about existing clusters from Nutanix
###############################################
# Get Cluster
data "nutanix_cluster" "demo" {
  name = "demo"
}

# Get Host
data "nutanix_hosts" "demo" {}

