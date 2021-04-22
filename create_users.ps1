# Importando el archibo csv
$usuarios = Import-Csv -Path C:\Users\Administrador\Desktop\mis_archivos\users.csv
# reccoriendo los usuarios extraidos del csv
foreach($campo in $usuarios) {
    #encriptando la clave para guardarlo
    $clave = ConvertTo-SecureString $campo.contra -AsPlainText -Force
    New-LocalUser $campo.usuario -FullName $campo.nom_completo -Password $clave -AccountNeverExpires -PasswordNeverExpires
    #añadiendo al usuario al grupo Usuarios
    Add-LocalGroupMember -Group usuarios -Member $campo.usuario
}
