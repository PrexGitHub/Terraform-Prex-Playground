Procedimiento
1° Crear pull request (solicitante)  
    git pull (dentro de main)
    git checkout -b tf/[nombre-carpeta]
    cambio archivo tf
    git add .
    git commit -m "Add Terraform module for new infrastructure"
    git push origin tf/[nombre-carpeta]
    ir a GitHub -> Pull request 
        Chequear cambios
        Pedir Pull Request

2° Aceptar Pull Request (Aprobador)
    ir a GitHub -> Pull request
        Ver Archivos Modificados
        Aceptar

3° Chequear que salio todo ok el GitHub Action 
(mediante git diff se van a detectar las carpetas donde hubo cambio, las ordena alfabeticamente y elige la primera)
(como buena practica deberia modificarse un recurso por rama creada, por ende solo una carpeta)

4° Eliminar Rama Creada (Solicitante)
     git switch main
     git branch -D tf/[nombre-carpeta]
     git push origin -d tf/[nombre-carpeta]