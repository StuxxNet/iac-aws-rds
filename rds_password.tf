resource "random_password" "this" {
  # Random password for the database
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "this_database_password" {
  # Store the database password in SSM Parameter Store
  name   = format("/%s/password", var.rds_name)
  type   = "SecureString"
  value  = random_password.this.result
  key_id = aws_kms_key.this.arn

  depends_on = [
    aws_kms_key.this,
    random_password.this
  ]
}