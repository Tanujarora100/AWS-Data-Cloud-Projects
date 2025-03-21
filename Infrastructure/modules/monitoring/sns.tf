resource "aws_sns_topic" "data-ingestion-sns" {
    name = "alert-notification-data-ingestion-sns"
}

resource "aws_sns_topic_policy" "data-ingestion-sns-policy" {
    arn    = aws_sns_topic.data-ingestion-sns.arn
    policy = jsonencode({
        Version   = "2012-10-17",
        Statement = [
            {
                Effect    = "Allow",
                Principal = "*",
                Action    = ["SNS:Publish","SNS:Receive"]
                Resource  = aws_sns_topic.data-ingestion-sns.arn
            }
        ]
    })
}
output "sns-topic-arn" {
    value = aws_sns_topic.data-ingestion-sns.arn
}