module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"

  bucket = var.name_project
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  # Configuración de acceso público (todas deshabilitadas)
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    enabled = var.environment == "dev"
  }
}
