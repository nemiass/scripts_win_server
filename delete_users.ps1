$usuarios = Import-Csv -Path C:\Users\Administrador\Desktop\mis_archivos\users.csv
foreach($campo in $usuarios) {
    #eliminando usuarios
    Remove-LocalUser $campo.usuario
}
