resource "aws_db_subnet_group" "this" {
  # Network definition
  count      = length(var.subnets)
  name       = format("subnet-group-%s", var.rds_name)
  subnet_ids = var.subnets
}