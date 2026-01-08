variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-fsmt-soat12"
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "East US 2"
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "aks-fsmt"
}

variable "node_count" {
  description = "The number of nodes in the AKS node pool"
  type        = number
  default     = 2
}