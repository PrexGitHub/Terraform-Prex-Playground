module "eventbridge" {
  source             = "terraform-aws-modules/eventbridge/aws"
  version            = "3.13.0"
  create_bus         = false
  role_name          = "role-eventbridge-${var.name-project}-${var.entity}-${var.aws_cuenta}"
  lambda_target_arns = [module.lambda.lambda_function_arn]

  rules = {
    crons-1mins = {
      description         = "Trigger for a Lambda cron 1 minutes"
      schedule_expression = "cron(*/1 * * * ? *)"
    }
  }

  targets = {
    crons-1mins = [
      {
        name = module.lambda.lambda_function_name
        arn  = module.lambda.lambda_function_arn
        # input = jsonencode({"job": "cron-by-rate"})
      }
    ]
  }
}

