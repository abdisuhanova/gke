# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "cred" {
  type = string
}
provider "google" {
  credentials = file(var.cred)
}
resource "google_compute_network" "vpc" {
  project                 = "playground-s-11-e0cdb590"
  name                    = "vpc-network"
  auto_create_subnetworks = true
  mtu                     = 1460
}
# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
