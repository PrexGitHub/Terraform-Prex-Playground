

# Módulo para la función Lambda
module "lambda" {
  # depends_on = [module.s3_bucket]
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.16.0"

  function_name = var.name-project
  handler       = "index.lambda_handler"
  architectures = ["arm64"] # x86_64 // arm64
  runtime       = var.runtime
  source_path   = ("${path.module}/lambda_code/index.py")
  description   = var.name-project
  timeout       = 60
  memory_size   = 256
  #S3 INTEGRATION
  store_on_s3 = false
  s3_bucket   = "lambda-build-${var.name-project}-${var.entity}-gitactions-test"

  # IAM ESPECIFICATION
  create_role = true
  #role = aws_iam_role.lambda_role.arn

  #Layers
  # layers = ["arn:aws:lambda:us-west-2:336392948345:layer:AWSSDKPandas-Python312-Arm64:13"]

  # NETWORK ESPECIFICATION

  # vpc_subnet_ids         = var.subnet_ids
  # vpc_security_group_ids = [module.security_group.security_group_id]
  # attach_network_policy  = true

  create_current_version_allowed_triggers = false

  allowed_triggers = {
    crons-1mins = {
      principal  = "events.amazonaws.com"
      source_arn = module.eventbridge.eventbridge_rule_arns["crons-1mins"]
    }

  }

  environment_variables = {
    API_BASE_URL = "dev-prextamos.prexcard.com.ar"
    API_KEY      = "1231abcd"
    # PATH1        = "/crons/push-notifications"
    # PATH2        = "/onboarding/itau-compliance"
    # PATH3        = "/onboarding/processor-registrations"
  }
}
