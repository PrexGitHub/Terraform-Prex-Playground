# Archivo .tflint.hcl

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

rule "terraform_unused_declarations" {
  enabled          = true
  ignore_variables = ["action_github"]
}
