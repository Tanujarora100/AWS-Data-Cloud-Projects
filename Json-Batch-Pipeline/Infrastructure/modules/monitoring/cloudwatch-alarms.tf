
resource "aws_cloudwatch_metric_alarm" "glue_failure_alarm" {
    alarm_name          = "GlueJobFailureAlarm"
    alarm_description   = "Alarm for Glue job failures"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 1
    metric_name         = "FailedJobs"
    namespace           = "Glue"
    period              = 300
    statistic           = "Sum"
    threshold           = 0
    alarm_actions       = [aws_sns_topic.data-ingestion-sns.arn]

    dimensions = {
        JobName = "YourGlueJobName"
    }
}

