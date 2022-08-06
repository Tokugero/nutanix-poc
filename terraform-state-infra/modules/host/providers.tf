terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 2.0.4"
    }

    nutanix = {
      source = "nutanix/nutanix"
      version = "~> 1.6.1"
    }
  }
}