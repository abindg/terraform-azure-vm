locals {
  client = var.client
  environment = var.environment
  resource_name_prefix = "${var.client}-${var.environment}"
}