variable "rds_name" {
  default     = "terraforming-rds"
  type        = string
  description = "The name of the RDS instance"
}

variable "db_name" {
  default     = "myapplication"
  type        = string
  description = "The name of the database inside the instance"
}

variable "instance_class" {
  default     = "db.t3.micro"
  type        = string
  description = "The database instance type"
}

variable "allocated_storage" {
  default     = 20
  type        = number
  description = "The allocated disk storage for the database"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets to deploy the database in"
  default     = []
}

variable "enable_public_access" {
  default     = false
  type        = bool
  description = "If the database should be accessible from the internet"
}

variable "enable_cloudwatch_logs" {
  default     = true
  type        = bool
  description = "If the database should send logs to CloudWatch"
}

variable "enable_automated_backups" {
  default     = true
  type        = bool
  description = "If the automated backups should be enabled"
}

variable "enable_read_replica" {
  default     = true
  type        = bool
  description = "If the database should have a read-replica enabled"
}

variable "enable_multi_az" {
  default     = true
  type        = bool
  description = "If the multi-az failover is active for the database or not"
}

variable "enable_immediate_apply" {
  default     = false
  type        = bool
  description = "If the configurations should be applied immediately or in the next downtime window only"
}
