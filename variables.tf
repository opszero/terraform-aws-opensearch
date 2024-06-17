variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Domain
################################################################################

variable "advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply"
  type        = map(string)
  default     = {}
}

variable "advanced_security_options" {
  description = "Configuration block for [fine-grained access control](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/fgac.html)"
  type        = any
  default = {
    enabled                = true
    anonymous_auth_enabled = false
  }
}

variable "auto_tune_options" {
  description = "Configuration block for the Auto-Tune options of the domain"
  type        = any
  default = {
    desired_state       = "ENABLED"
    rollback_on_disable = "NO_ROLLBACK"
  }
}

variable "cluster_config" {
  description = "Configuration block for the cluster of the domain"
  type        = any
  default = {
    dedicated_master_enabled = true
  }
}

variable "cognito_options" {
  description = "Configuration block for authenticating Kibana with Cognito"
  type        = any
  default     = {}
}

variable "domain_endpoint_options" {
  description = "Configuration block for domain endpoint HTTP(S) related options"
  type        = any
  default = {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }
}

variable "domain_name" {
  description = "Name of the domain"
  type        = string
  default     = ""
}

variable "ebs_options" {
  description = "Configuration block for EBS related options, may be required based on chosen [instance size](https://aws.amazon.com/elasticsearch-service/pricing/)"
  type        = any
  default = {
    ebs_enabled = true
    volume_size = 64
    volume_type = "gp3"
  }
}

variable "encrypt_at_rest" {
  description = "Configuration block for encrypting at rest"
  type        = any
  default = {
    enabled = true
  }
}

variable "engine_version" {
  description = "Version of the OpenSearch engine to use"
  type        = string
  default     = null
}

variable "log_publishing_options" {
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs. This block can be declared multiple times, for each log_type, within the same resource"
  type        = any
  default = [
    { log_type = "INDEX_SLOW_LOGS" },
    { log_type = "SEARCH_SLOW_LOGS" },
  ]
}

variable "node_to_node_encryption" {
  description = "Configuration block for node-to-node encryption options"
  type        = any
  default = {
    enabled = true
  }
}

variable "off_peak_window_options" {
  description = "Configuration to add Off Peak update options"
  type        = any
  default = {
    enabled = true
    off_peak_window = {
      hours = 7
    }
  }
}

variable "software_update_options" {
  description = "Software update options for the domain"
  type        = any
  default = {
    auto_software_update_enabled = true
  }
}

variable "vpc_options" {
  description = "Configuration block for VPC related options. Adding or removing this configuration forces a new resource ([documentation](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-vpc-limitations))"
  type        = any
  default     = {}
}

################################################################################
# Package Association(s)
################################################################################

variable "package_associations" {
  description = "Map of package association IDs to associate with the domain"
  type        = map(string)
  default     = {}
}

################################################################################
# VPC Endpoint(s)
################################################################################

variable "vpc_endpoints" {
  description = "Map of VPC endpoints to create for the domain"
  type        = any
  default     = {}
}

################################################################################
# Access Policy
################################################################################

variable "enable_access_policy" {
  description = "Determines whether an access policy will be applied to the domain"
  type        = bool
  default     = true
}

variable "create_access_policy" {
  description = "Determines whether an access policy will be created"
  type        = bool
  default     = true
}

variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain. Required if `create_access_policy` is `false`"
  type        = string
  default     = null
}

variable "access_policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

variable "access_policy_source_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "access_policy_override_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

################################################################################
# SAML Options
################################################################################

variable "create_saml_options" {
  description = "Determines whether SAML options will be created"
  type        = bool
  default     = false
}

variable "saml_options" {
  description = "SAML authentication options for an AWS OpenSearch Domain"
  type        = any
  default     = {}
}

################################################################################
# Outbound Connections
################################################################################

variable "outbound_connections" {
  description = "Map of AWS OpenSearch outbound connections to create"
  type        = any
  default     = {}
}

################################################################################
# CloudWatch Log Group
################################################################################

variable "create_cloudwatch_log_groups" {
  description = "Determines whether log groups are created"
  type        = bool
  default     = true
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "Number of days to retain log events"
  type        = number
  default     = 60
}

variable "cloudwatch_log_group_kms_key_id" {
  description = "If a KMS Key ARN is set, this key will be used to encrypt the corresponding log group. Please be sure that the KMS Key has an appropriate key policy (https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html)"
  type        = string
  default     = null
}

variable "create_cloudwatch_log_resource_policy" {
  description = "Determines whether a resource policy will be created for OpenSearch to log to CloudWatch"
  type        = bool
  default     = true
}

variable "cloudwatch_log_resource_policy_name" {
  description = "Name of the resource policy for OpenSearch to log to CloudWatch"
  type        = string
  default     = null
}

################################################################################
# Security Group
################################################################################

variable "create_security_group" {
  description = "Determines if a security group is created"
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "Name to use on security group created"
  type        = string
  default     = null
}

variable "security_group_use_name_prefix" {
  description = "Determines whether the security group name (`security_group_name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "security_group_description" {
  description = "Description of the security group created"
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "Security group ingress and egress rules to add to the security group created"
  type        = any
  default     = {}
}

variable "security_group_tags" {
  description = "A map of additional tags to add to the security group created"
  type        = map(string)
  default     = {}
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
