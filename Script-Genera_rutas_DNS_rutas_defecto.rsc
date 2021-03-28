########################################################################################################
## Script que genera rutas de DNS a Google y rutas por defecto - Capturando el GW automáticamente     ##
## Scritp funcional para RB951 - RBM33G                                                               ##
## Ingeniero Andres Aguillon                                                                          ##
## 21 de enero del 2021                                                                               ##
######################################################################################################## 
#Captura el array donde esta contenido el GW de cada enlace
:global GWPP [/ip route get [/ip route find where dst-address=X.X.X.X/32]];
:global GWBK [/ip route get [/ip route find where dst-address=X.X.X.X/32]];
/
#Toma String que contiene el gateway de los enlaces
:global GWPrincipal ($GWPP->"gateway");
:global GWBackup ($GWBK->"gateway");
/
#Agrega rutas DNS GOOGLE
:ip route add comment="DNS GOOGLE Principal" dst-address=8.8.8.8 gateway=($GWPrincipal) scope=10 target-scope=10
:ip route add comment="DNS GOOGLE Backup" dst-address=8.8.4.4 gateway=($GWBackup) scope=10 target-scope=10
/
#Obtiene el array donde esta contenido el DNS de cada enlace
:global DNSGooglePrincipal [/ip route get [/ip route find where dst-address=8.8.8.8/32]];
:global DNSGoogleBackup [/ip route get [/ip route find where dst-address=8.8.4.4/32]];
/
#Obtiene el Sring contenido en el dst-address
:global GWPrincipalStr ($DNSGooglePrincipal->"dst-address");
:global GWBackupStr ($DNSGoogleBackup->"dst-address");
/
#Elimina caracteres no necesarios
:global GWPrincipalStr [:pick $GWPrincipalStr 0 [:find $GWPrincipalStr "/32"]];
:global GWBackupStr [:pick $GWBackupStr 0 [:find $GWBackupStr "/32"]];
/
#Agrega rutas por defecto
:ip route add comment="Default route GOOGLE Principal" dst-address=0.0.0.0/0 gateway=($GWPrincipalStr) distance=3 scope=30 target-scope=10
:ip route add comment="Default route GOOGLE Backup" dst-address=0.0.0.0/0 gateway=($GWBackupStr) distance=4 scope=30 target-scope=10
/
#Agrega Rutas DNS Google si es RBM33G con LTE
:ip route add comment="DNS GOOGLE Principal" dst-address=8.8.8.8 gateway=HITPP scope=10 target-scope=10
:ip route add comment="DNS GOOGLE Backup" dst-address=8.8.4.4 gateway=HITBK scope=10 target-scope=10