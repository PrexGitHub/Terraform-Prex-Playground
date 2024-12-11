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
variable "name-project" {
  description = "Name del proyecto S3 prextamos"
  type        = string
  default     = "test-gitactions-prex-playground"
}

/////////////////////////
//VARIABLES DEL PROVIDER
# variable "aws_cuenta" {
#   description = "Nombre de la cuenta"
#   type        = string
#   default     = "prex-dev-ar"
# }
variable "aws_region" {
  description = "Region de Aws destino"
  type        = string
  default     = "us-east-1"
}

/////////////////////////
//VARIABLES DEL PROYECTO
variable "runtime" {
  description = "Tipo de runtime a usar: [nodejs20.x]-[nodejs18.x]-[python3.12]-[python3.11]-[java21]-[java17]-[dotnet8]-[ruby3.3]-[ruby3.2]"
  type        = string
  default     = "python3.13"
}

variable "zip-version" {
  description = "Version of the zip Code"
  default     = "1"
}

###### para la VPC
# Definición de las variables de red (subredes y grupos de seguridad)
# variable "subnet_ids" {
#   description = "List of VPC subnet IDs"
#   type        = list(string)
#   default     = ["subnet-01366c256f2e2b7ff", "subnet-0de6144ef0dc36ab6"]
# }
# variable "vpc-id" {
#   description = "VPC-ID"
#   type        = string
#   default     = "vpc-0c3fd3f4dade87a70"
# }

