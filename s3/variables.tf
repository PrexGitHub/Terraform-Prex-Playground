//VARIABLES PARA TAGS 
//RESPETAR MINUSCULAS, COPIAR Y PEGAR SOLAMENTE
variable "environment" {
  description = "Values: [dev]-[prod]-[qa]-[uat]-[pre]-[release]-[stage]-[contingencia]"
  type        = string
  default     = "dev"
}
variable "workload" {
  description = "Values: [conectividad]-[monitoreo]-[reporteria]-[aplicativo]-[gestionUsuarios]-[automatismo]-[procesamiento]"
  type        = string
  default     = "aplicativo"
}
variable "owner" {
  description = "Values: [infraestructura]-[data]-[security]-[desarrollo]"
  type        = string
  default     = "infraestructura"
}
variable "entity" {
  description = "Values: [peru]-[uruguay]-[chile]-[paraguay]-[global]-[houlak]-[procesador]"
  type        = string
  default     = "playground"
}
variable "backup" {
  description = "Values: [true]-[false]"
  type        = string
  default     = "false"
}
variable "tier" {
  description = "Values: [low]-[medium]-[high]"
  type        = string
  default     = ""
}
variable "name_project" {
  description = "Name del proyecto S3 prextamos"
  type        = string
  default     = "test-gitactions-prex-playground"
}

/////////////////////////
//VARIABLES DEL PROVIDER
# variable "aws_cuenta" {
#   description = "Nombre de la cuenta"
#   type        = string
#   default     = "prexarrdev"
# }
variable "aws_region" {
  description = "Region de Aws destino"
  type        = string
  default     = "us-east-1"
}

