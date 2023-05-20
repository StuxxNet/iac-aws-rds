resource "aws_db_instance" "this_rds_replica" {
  count = var.enable_read_replica ? 3 : 0

  # Replica General Information
  identifier = format("%s-replica", var.rds_name)

  # Source database instance
  replicate_source_db = aws_db_instance.this.id

  # Backup retention for the replica is 0. The replica does not need to be backed up.
  backup_retention_period = 0

  # Compute Power
  instance_class = var.instance_class

  # MultiAZ configuration
  multi_az = var.enable_multi_az

  # Storage Encryption
  kms_key_id        = aws_kms_key.this.arn
  storage_encrypted = true

  # Deletion Configuration
  skip_final_snapshot = true

  timeouts {
    create = "3h"
    delete = "3h"
    update = "3h"
  }

  depends_on = [
    aws_db_instance.this
  ]
}