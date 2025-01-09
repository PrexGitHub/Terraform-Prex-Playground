# Archivo .tflint.hcl

rule "terraform_unused_variable" {
  enabled = true # Habilita esta regla
  ignore_variables = ["action_github"]
}
