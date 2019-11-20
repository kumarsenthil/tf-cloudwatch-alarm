resource "aws_cloudwatch_metric_alarm" "billing_alarm_to_existing_sns" {
  alarm_name          = "billing-alarm-${var.monthly_billing_threshold}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "28800"
  statistic           = "Maximum"
  alarm_description   = "Billing consolidated alarm >= US$ ${var.monthly_billing_threshold}"
  threshold           = "${var.monthly_billing_threshold}"
  alarm_actions       = ["${var.aws_sns_topic_arn}"]

  dimensions = {
    Currency = "${var.currency}"
  }
}
