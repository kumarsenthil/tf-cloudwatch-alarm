provider "aws" {
  region = "${var.region}"
  version = "~> 2.7"
}

locals {
  cloudwatch_alarm = var.cloudwatch_alarm
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm_to_existing_sns" {
  for_each  = local.cloudwatch_alarm
  alarm_name          = each.key
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  alarm_description   = "Billing consolidated alarm >= US$"
  threshold           = lookup(each.value, "monthly_billing_threshold", null)
  alarm_actions       = [ lookup(each.value, "sns_topic_arn", null) ]

  dimensions = {
    Currency = lookup(each.value, "currency", null)
  }
}
