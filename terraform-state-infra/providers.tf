terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 2.0.4"
    }

    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 1.6.1"
    }
  }
}

provider "netbox" {
  server_url = var.netbox_ip
  api_token  = var.netbox_token
}

provider "nutanix" {
  username = var.nutanix_username
  password = var.nutanix_password
  endpoint = var.nutanix_cluster_ip
  insecure = true
}
