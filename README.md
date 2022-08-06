# Notes

## Setup

### Netbox

1. log into container
1. python3 /app/netbox/netbox/manage.py createsuperuser

### Terraform

1. .auto.tfvars

### Grafana

### Influx

### Telegraf

### Nutanix

1. Ffffffffffff Good luck.

### Ansible

```
docker build -t ansible ./build/ansible/.
alias ans='docker run -it --env-file .env -v $(pwd)/ansible:/ansible/ ansible'
ans ansible
```

---

## Terraform State

### Use TF to create the VM, Monitoring, IPAM entries

### Use TF to create Monitoring, IPAM entries

### Use TF to generate grafana based on IPAM

### Use TF to generate diagrams based on IPAM

---

## Terraform Breakdown

### Global Environment/Infra

#### Nutanix

- Cluster
- Host(s)

#### Netbox

- IPAM
- IP Ranges
- Org creation
- Racks creation
- Tag creation

#### Grafana

- Nutanix dashboard
- Netbox dashboard
- All Host view
- All IPAM view
- All Racks view
- Org view
  - Sites view
  - Regions view
  - Location view
- Rack view

#### Telegraf

- Nutanix inputs
- Netbox inputs
- Influx outputs

---

### Specific

#### Nutanix

- VM + Specs
- Network stuff

#### Netbox

- IP
- Org register
- Rack register
- Spec register

#### Grafana

- VM Specific stats
- Links to netbox runbooks
- Links to netbox ipam details
- custom widgets

#### Telegraf

- vm input
- custom inputs
