variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"

}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}