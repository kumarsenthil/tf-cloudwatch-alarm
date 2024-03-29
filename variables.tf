variable "region" {
  type = string
  description = "Name of the region"
  default = "us-east-1"
}

variable "account_alias" {
  description = "Account alias for Cloudwatch"
  type        = string
}

variable "cloudwatch_alarm" {
  description = "The map of map of cloudwatch Alarm to create"
  type        = map(map(string))
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN for Cloudwatch"
  type        = list
}


