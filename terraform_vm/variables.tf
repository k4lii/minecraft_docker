variable "credentials_file" {
  description = "The GCP credentials file"
}

variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region"
}

variable "zone" {
  description = "The GCP zone"
}

variable "instance_name" {
  description = "The instance name"
}

variable "machine_type" {
  description = "The machine type"
}

variable "disk_image" {
  description = "The disk image"
}

variable "ssh_user" {
  description = "The SSH username"
}

variable "ssh_public_key" {
  description = "The SSH public key file"
}

variable "ssh_private_key" {
  description = "The SSH private key file"
}


variable "cloudflare_email" {
  description = "Your Cloudflare account email"
  type        = string
}

variable "cloudflare_api_key" {
  description = "Your Cloudflare API key"
  type        = string
  sensitive   = true
}