# Archivo .tflint.hcl

rule "terraform_unused_variable" {
  ignore_variables = ["action_github"]
}
