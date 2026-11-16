# variable "group_count" {
#   description = "Number of resource groups to create"
#   type        = number
#   default     = 3
# }
variable "group_name" {
  description = "Number of resource groups to create"
  type        = list(string)
  default     = ["dev", "val", "prod"]
}
