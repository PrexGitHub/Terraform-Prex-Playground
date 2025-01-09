Procedimiento
1° Crear rama, editar y chequear el plan (solicitante)  
    git pull (dentro de main)
    git checkout -b tf/[path-carpeta]
    cambio archivo tf
    modificar variables.tf, la variable "action_github", poner apply o destroy segun lo que necesite
    git add .
    git commit -m "Add Terraform module for new infrastructure"
    git push origin tf/[path-carpeta]

2° Ver el resultado del terraform plan (solicitante) 
El paso anterior genera un terraform plan, chequear para saber si esta todo ok.

3° Generar el PR (solicitante) 
    ir a GitHub -> Pull request 
        Chequear cambios
        Pedir Pull Request

4° Aceptar Pull Request (Aprobador)
    ir a GitHub -> Pull request
        Ver Archivos Modificados
        Aceptar

5° Chequear que salio todo ok el GitHub Action 
El paso anterior genera de vuelta el terraform plan, luego de este se puede aceptar un APPLY o un DESTROY. Elegir el que crea necesario

6° Eliminar Rama Creada (Solicitante) -> chequeado este todo ok
     git switch main
     git branch -D tf/[path-carpeta]
     git push origin -d tf/[path-carpeta]