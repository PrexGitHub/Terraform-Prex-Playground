output "lambda_function_name" {
   description = "Nombre de la Lambda function"
   #value       = module.lambda.function_name
   value       = module.lambda.lambda_function_name
 }

 output "lambda_function_arn" {
   description = "ARN de la Lambda function"
   value       = module.lambda.lambda_function_arn
 }

output "action_github" {
  description = "Setear apply|destroy para realizar la accion que necesite"
  value = var.action_github
}

