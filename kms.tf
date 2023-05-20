resource "aws_kms_key" "this" {
  # KMS key to encrypt database disk
  description = var.rds_name
}

resource "aws_kms_alias" "this" {
  # Alias to find the key in the console
  name          = format("alias/%s", var.rds_name)
  target_key_id = aws_kms_key.this.key_id
}