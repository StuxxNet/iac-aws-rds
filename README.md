## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.65.0 |

## ToDos
- [ ] Proxy (Aurora)
- [ ] Security Groups
- [ ] Parameter Groups
- [ ] Tags

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/db_instance) | resource |
| [aws_db_instance.this_rds_replica](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/db_subnet_group) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/kms_key) | resource |
| [aws_ssm_parameter.this_database_password](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated disk storage for the database | `number` | `20` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database inside the instance | `string` | `"myapplication"` | no |
| <a name="input_enable_automated_backups"></a> [enable\_automated\_backups](#input\_enable\_automated\_backups) | If the automated backups should be enabled | `bool` | `true` | no |
| <a name="input_enable_cloudwatch_logs"></a> [enable\_cloudwatch\_logs](#input\_enable\_cloudwatch\_logs) | If the database should send logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enable_immediate_apply"></a> [enable\_immediate\_apply](#input\_enable\_immediate\_apply) | If the configurations should be applied immediately or in the next downtime window only | `bool` | `false` | no |
| <a name="input_enable_multi_az"></a> [enable\_multi\_az](#input\_enable\_multi\_az) | If the multi-az failover is active for the database or not | `bool` | `true` | no |
| <a name="input_enable_public_access"></a> [enable\_public\_access](#input\_enable\_public\_access) | If the database should be accessible from the internet | `bool` | `false` | no |
| <a name="input_enable_read_replica"></a> [enable\_read\_replica](#input\_enable\_read\_replica) | If the database should have a read-replica enabled | `bool` | `true` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The database instance type | `string` | `"db.t3.micro"` | no |
| <a name="input_rds_name"></a> [rds\_name](#input\_rds\_name) | The name of the RDS instance | `string` | `"terraforming-rds"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The subnets to deploy the database in | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | The endpoint of the RDS instance |
