# AWS Networking Module

This repository contains a reusable Terraform module for provisioning a basic AWS networking foundation.

The module creates:

- **1 VPC**
- **2 public subnets** in separate Availability Zones
- **1 Internet Gateway**
- **1 public route table**
- **1 default internet route (`0.0.0.0/0`)**
- **Route table associations** for both public subnets

This setup is a simple starting point for deploying public-facing AWS resources such as EC2 instances, load balancers, or other application infrastructure.

---

## Architecture Overview

The module provisions a basic public network layout in AWS:

- A single **VPC** acts as the isolated virtual network.
- Two **public subnets** are created across different Availability Zones for higher availability.
- An **Internet Gateway** is attached to the VPC to allow internet access.
- A **public route table** is created with a default route to the Internet Gateway.
- Both public subnets are associated with the public route table.

---

## Architecture Diagram

![AWS networking module](05-aws-networking-module/architecture_diagram/aws-networking module.png)
