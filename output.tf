output "cloudwatch_alarm" {
    value = [for v in aws_cloudwatch_metric_alarm.billing_alarm_to_existing_sns : v.arn]
    description = "CloudWatch Alarm ARN"
}
