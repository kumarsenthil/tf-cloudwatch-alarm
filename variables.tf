variable "region" {
  type = string
  description = "Name of the region"
  default = "us-east-1"
}

variable "cloudwatch_alarm" {
  description = "The map of map of cloudwatch Alarm to create"
  type        = map(map(string))
}

