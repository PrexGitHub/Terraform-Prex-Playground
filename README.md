# Proyecto de Terraform para Despliegue en AWS

Este proyecto utiliza Terraform y GitHub Actions para desplegar un bucket S3 en AWS. La configuración incluye un flujo de trabajo automatizado que permite ejecutar las configuraciones de Terraform con aprobación previa.

## Descripción del Archivo `deploy.yaml` de GitHub Actions

El archivo `deploy.yaml` en GitHub Actions define un flujo de trabajo que:
1. Verifica el código de Terraform (`terraform fmt` y `terraform validate`).
2. Inicializa y planifica los cambios de Terraform.
3. Solicita aprobación antes de aplicar cualquier cambio en AWS.
4. Aplica los cambios en AWS al recibir la aprobación.
5. Realiza un merge automático si el despliegue es exitoso.

### Estructura del Workflow

- **Paso 1-3**: Verificación de formato, inicialización y validación de código.
- **Paso 4**: Generación del plan de despliegue y salida del plan.
- **Paso 5**: Solicitud de aprobación del equipo (en GitHub) antes de aplicar el despliegue.
- **Paso 6**: Aplicación de cambios en AWS una vez aprobado.
- **Paso 7**: Merge automático en caso de éxito del despliegue.

## Configuración Necesaria en GitHub Actions

### Secretos Requeridos

Para que GitHub Actions tenga acceso a AWS, debes configurar dos secretos en el repositorio de GitHub:

1. **AWS_ROLE_ARN**: El ARN del Role de IAM en AWS que permite a GitHub Actions asumir permisos para realizar acciones en tu cuenta.
2. **AWS_REGION**: La región de AWS en la que deseas desplegar los recursos, por ejemplo, `us-east-1`.

Para agregar estos secretos:
1. En GitHub, ve a **Settings > Secrets and Variables > Actions** en tu repositorio.
2. Haz clic en **New repository secret** y agrega los siguientes:
   - **`AWS_ROLE_ARN`**: el ARN del Role de IAM configurado en AWS.
   - **`AWS_REGION`**: la región de AWS, como `us-east-1`.

### Creación del Environment

En el archivo `deploy.yaml`, el workflow usa un `environment` de GitHub llamado `development`. Puedes crear este environment en tu repositorio siguiendo estos pasos:

1. Ve a **Settings > Environments** en tu repositorio.
2. Haz clic en **New environment** y nómbralo `development`.
3. Guarda los cambios.

## Configuración Necesaria en AWS
### 1. Crear un Identity Providers (https://www.youtube.com/watch?v=aOoRaVuh8Lc)
1. Abre la consola de IAM en AWS.
2. Ve a **Identity providers** y selecciona **Add Provider**.
3. OpenID Connect
4. 
Provider URL: https://token.actions.githubusercontent.com
Audience: sts.amazonaws.com

### 2. Crear un Role de IAM para GitHub Actions

Debes crear un Role en AWS IAM que permita a GitHub Actions realizar las acciones de Terraform en tu cuenta.

1. Abre la consola de IAM en AWS.
2. Ve a **Roles** y selecciona **Create Role**.
3. Selecciona **AWS Account** y luego **Another AWS Account**.
4. Ingresa tu propio **Account ID**.
5. En la pestaña **Permissions**, selecciona las políticas que el Role necesita para tu infraestructura. Por ejemplo:
   - `AmazonS3FullAccess` para gestionar buckets de S3.

6. En la pestaña **Trust Relationships** de este Role, edita la política de confianza con el siguiente JSON, reemplazando `PrexGitHub/Terraform-Prex-Playground` con el nombre de tu repositorio:

   ```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::891377079132:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:PrexGitHub/Terraform-Prex-Playground:*"
                }
            }
        }
    ]
}
