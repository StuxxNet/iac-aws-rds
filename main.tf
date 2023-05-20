resource "aws_db_instance" "this" {
  # Database definition
  identifier           = format("%s-main", var.rds_name)
  engine               = "postgres"
  engine_version       = "15.2"

  # Apply Immediately
  apply_immediately = var.enable_immediate_apply

  # Storage and Encryption
  storage_type          = "gp3"
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.allocated_storage * 2
  storage_encrypted     = true
  kms_key_id            = aws_kms_key.this.arn

  # Network
  db_subnet_group_name = length(var.subnets) > 0 ? aws_db_subnet_group.this[0].name : ""
  publicly_accessible  = var.enable_public_access

  # Compute Power
  instance_class = var.instance_class
  multi_az       = var.enable_multi_az

  # Backup
  backup_window           = var.enable_automated_backups || var.enable_read_replica || var.enable_multi_az ? "02:00-03:00" : ""
  backup_retention_period = var.enable_automated_backups || var.enable_read_replica || var.enable_multi_az ? 7 : 0

  # Maintenance & Monitoring
  maintenance_window = "Mon:05:00-Mon:06:00"
  enabled_cloudwatch_logs_exports = var.enable_cloudwatch_logs ? [
    "postgresql",
    "upgrade"
  ] : []

  # Database Name & Access
  db_name  = var.db_name
  username = "postgres"
  password = random_password.this.result

  # Snapshots
  skip_final_snapshot       = false
  final_snapshot_identifier = format("%s-final", var.rds_name)
  deletion_protection       = true

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }

  depends_on = [
    aws_db_subnet_group.this,
    aws_kms_key.this
  ]
}