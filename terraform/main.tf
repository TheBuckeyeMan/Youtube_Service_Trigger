resource "aws_cloudwatch_event_rule" "daily_lambda_trigger" {
  name                = "DailyLambdaTrigger"
  description         = "Triggers youtube-service-1 Lambda once per day"
  schedule_expression = "cron(0 0/8 * * ? *)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.daily_lambda_trigger.name
  arn       = "arn:aws:lambda:us-east-2:339712758982:function:youtube-service-1"
  target_id = "youtube-service-1-target"
}