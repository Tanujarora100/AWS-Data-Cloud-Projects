variable "sns_topic_name" {
    description = "The name of the SNS topic"
    type        = string
}

variable "sns_display_name" {
    description = "The display name for the SNS topic"
    type        = string
    default     = "Default SNS Topic Display Name"
}

variable "sns_tags" {
    description = "A map of tags to assign to the SNS topic"
    type        = map(string)
    default     = {}
}

variable "sns_subscriptions" {
    type = list(object({
        protocol = string
        endpoint = string
    }))
    default = [
        {
            protocol = "email"
            endpoint = ""
        }
    ]
}