###########################################################################
##---------------------------PUNTOS CLAVE -------------------------------##
##------------- Realizado por Ingeniero Andres Aguillon -----------------##
###########################################################################

#global myDate ( "DATE"."-".[: pick [/system clock get date] 0 11])  --> Resultado "DATE-jun/28/2022"
# m m m / d d / a a a a  
# 0 1 2 3 4 5 6 7 8 9 10 11

:local myFile1 ( "BACKUP"."-".[/system identity get name]."-".[: pick [/system clock get date] 4 6]. [: pick [/system clock get date] 0 3]. [: pick [/system clock get date] 7 11]);
:put $myFile1;
:log info "Respaldo creado $myFile1";

# Crea backups
/system backup save name=$myFile1;
/export file=$myFile1;

# Carga informacion al server SFTP
/tool fetch url="sftp://serverSFTP/ubicacion/$myFile1.backup" user=userSFTP password=p4$$w0rd  src-path="$myFile1.backup" upload=yes;
/tool fetch url="sftp://serverSFTP/ubicacion/$myFile1.rsc" user=userSFTP password=p4$$w0rd  src-path="$myFile1.rsc" upload=yes;

# Elimina archivos de los Backups del mikrotik
:foreach i in=[/file find] do={:if ([:typeof [:find [/file get $i name] "BACKUP"]]!="nil") do={/file remove $i}};
:log info "Respaldo terminado $myFile1";
