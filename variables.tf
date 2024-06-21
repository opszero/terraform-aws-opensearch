variable "create" {
  type        = bool
  default     = true
  description = "Determines whether resources will be created (affects all resources)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources"
}

variable "advanced_options" {
  type        = map(string)
  default     = {}
  description = "Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply"
}

variable "advanced_security_options" {
  type = any
  default = {
    enabled                = true
    anonymous_auth_enabled = false
  }
  description = "Configuration block for [fine-grained access control](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/fgac.html)"
}

variable "auto_tune_options" {
  type = any
  default = {
    desired_state       = "ENABLED"
    rollback_on_disable = "NO_ROLLBACK"
  }
  description = "Configuration block for the Auto-Tune options of the domain"
}

variable "cluster_config" {
  type = any
  default = {
    dedicated_master_enabled = true
  }
  description = "Configuration block for the cluster of the domain"
}

variable "cognito_options" {
  type        = any
  default     = {}
  description = "Configuration block for authenticating Kibana with Cognito"
}

variable "domain_endpoint_options" {
  type = any
  default = {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }
  description = "Configuration block for domain endpoint HTTP(S) related options"
}

variable "domain_name" {
  type        = string
  default     = ""
  description = "Name of the domain"
}

variable "ebs_options" {
  type = any
  default = {
    ebs_enabled = true
    volume_size = 64
    volume_type = "gp3"
  }
  description = "Configuration block for EBS related options, may be required based on chosen [instance size](https://aws.amazon.com/elasticsearch-service/pricing/)"
}

variable "encrypt_at_rest" {
  type = any
  default = {
    enabled = true
  }
  description = "Configuration block for encrypting at rest"
}

variable "engine_version" {
  type        = string
  default     = null
  description = "Version of the OpenSearch engine to use"
}

variable "log_publishing_options" {
  type = any
  default = [
    { log_type = "INDEX_SLOW_LOGS" },
    { log_type = "SEARCH_SLOW_LOGS" },
  ]
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs. This block can be declared multiple times, for each log_type, within the same resource"
}

variable "node_to_node_encryption" {
  type = any
  default = {
    enabled = true
  }
  description = "Configuration block for node-to-node encryption options"
}

variable "off_peak_window_options" {
  type = any
  default = {
    enabled = true
    off_peak_window = {
      hours = 7
    }
  }
  description = "Configuration to add Off Peak update options"
}

variable "software_update_options" {
  type = any
  default = {
    auto_software_update_enabled = true
  }
  description = "Software update options for the domain"
}

variable "vpc_options" {
  type        = any
  default     = {}
  description = "Configuration block for VPC related options. Adding or removing this configuration forces a new resource ([documentation](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-vpc-limitations))"
}

variable "package_associations" {
  type        = map(string)
  default     = {}
  description = "Map of package association IDs to associate with the domain"
}

variable "vpc_endpoints" {
  type        = any
  default     = {}
  description = "Map of VPC endpoints to create for the domain"
}

variable "enable_access_policy" {
  type        = bool
  default     = true
  description = "Determines whether an access policy will be applied to the domain"
}

variable "create_access_policy" {
  type        = bool
  default     = true
  description = "Determines whether an access policy will be created"
}

variable "access_policies" {
  type        = string
  default     = null
  description = "IAM policy document specifying the access policies for the domain. Required if `create_access_policy` is `false`"
}

variable "access_policy_statements" {
  type        = any
  default     = {}
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
}

variable "access_policy_source_policy_documents" {
  type        = list(string)
  default     = []
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
}

variable "access_policy_override_policy_documents" {
  type        = list(string)
  default     = []
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
}

variable "create_saml_options" {
  type        = bool
  default     = false
  description = "Determines whether SAML options will be created"
}

variable "saml_options" {
  type        = any
  default     = {}
  description = "SAML authentication options for an AWS OpenSearch Domain"
}

variable "outbound_connections" {
  type        = any
  default     = {}
  description = "Map of AWS OpenSearch outbound connections to create"
}

variable "create_cloudwatch_log_groups" {
  type        = bool
  default     = true
  description = "Determines whether log groups are created"
}

variable "cloudwatch_log_group_retention_in_days" {
  type        = number
  default     = 60
  description = "Number of days to retain log events"
}

variable "cloudwatch_log_group_kms_key_id" {
  type        = string
  default     = null
  description = "If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
}

variable "create_cloudwatch_log_resource_policy" {
  type        = bool
  default     = true
  description = "Determines whether a resource policy will be created for OpenSearch to log to CloudWatch"
}

variable "cloudwatch_log_resource_policy_name" {
  type        = string
  default     = null
  description = "Name of the resource policy for OpenSearch to log to CloudWatch"
}

variable "create_security_group" {
  type        = bool
  default     = true
  description = "Determines if a security group is created"
}

variable "security_group_name" {
  type        = string
  default     = null
  description = "Name to use on security group created"
}

variable "security_group_use_name_prefix" {
  type        = bool
  default     = true
  description = "Determines whether the security group name (`security_group_name`) is used as a prefix"
}

variable "security_group_description" {
  type        = string
  default     = null
  description = "Description of the security group created"
}

variable "security_group_rules" {
  type        = any
  default     = {}
  description = "Security group ingress and egress rules to add to the security group created"
}

variable "security_group_tags" {
  type        = map(string)
  default     = {}
  description = "A map of additional tags to add to the security group created"
}

variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control module creation."
}

variable "kms_key_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the kms is enabled or disabled."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at_rest_encryption_enabled = true."
}

variable "kms_description" {
  type        = string
  default     = "Parameter Store KMS master key"
  description = "The description of the key as viewed in AWS console."
}

variable "key_usage" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  sensitive   = true
  description = "Specifies the intended use of the key. Defaults to ENCRYPT_DECRYPT, and only symmetric encryption and decryption are supported."
}

variable "deletion_window_in_days" {
  type        = number
  default     = 7
  description = "Duration in days after which the key is deleted after destruction of the resource."
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the key is enabled."
}

variable "enable_key_rotation" {
  type        = string
  default     = true
  description = "Specifies whether key rotation is enabled."
}

variable "customer_master_key_spec" {
  type        = string
  default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT."
  sensitive   = true
}

variable "kms_multi_region" {
  type        = bool
  default     = false
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key."
}

variable "alias" {
  type        = string
  default     = "alias/opensearch"
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash."
}
