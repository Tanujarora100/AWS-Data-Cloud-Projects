resource "aws_sns_topic" "data-ingestion-sns" {
  name = var.sns_topic_name
  display_name = var.sns_display_name
}

resource "aws_sns_topic_policy" "data-ingestion-sns-policy" {
  arn = aws_sns_topic.data-ingestion-sns.arn
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = ["SNS:Publish", "SNS:Receive"]
        Resource  = aws_sns_topic.data-ingestion-sns.arn
      }
    ]
  })
  depends_on = [ 
    aws_sns_topic.data-ingestion-sns
   ]
}

resource "aws_sns_topic_subscription" "alert_notification" {
    for_each = { for idx, sub in var.sns_subscriptions : idx => sub }
    topic_arn = aws_sns_topic.data-ingestion-sns.arn
    protocol  = each.value.protocol
    endpoint  = each.value.endpoint
}
