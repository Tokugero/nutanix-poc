FROM python:3.8-slim-buster

ENV NUTANIX="1.4.0"
ENV NETBOX="3.7.1"
ENV PYNETBOX="6.6.1"

RUN apt-get update && apt-get install -y \
    git && \
    pip install ansible pynetbox==$PYNETBOX && \
    git clone https://github.com/nutanix/nutanix.ansible.git && \
    cd nutanix.ansible && \
    ansible-galaxy collection build && \
    ansible-galaxy collection install /nutanix.ansible/nutanix-ncp-$NUTANIX.tar.gz && \
    ansible-galaxy collection install netbox.netbox:=$NETBOX -f && \
    rm -rf /nutanix.ansible && \
    rm -rf /var/lib/apt/lists/*
