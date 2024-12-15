resource "aws_cloudwatch_event_rule" "daily_lambda_trigger" {
  name                = "YoutubeApplicationTrigger"
  description         = "Event Bridge Instance for Youtube Application. This Event Bridge instance will trigger the youtube application via youtube-service-1 every 8 hours"
  schedule_expression = "cron(0 0/6 * * ? *)" #Syntax: (minute of each hour) (0/Every X Hours) (Days of the month) (Month) (Day of the week) (year) 
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.daily_lambda_trigger.name
  arn       = "arn:aws:lambda:us-east-2:339712758982:function:youtube-service-1"
  target_id = "youtube-service-1-target"
}