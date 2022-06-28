########################################################################################################
## Script que genera rutas de DNS a OpenDNS y rutas por defecto - Capturando el GW automaticamente    ##
## Scritp funcional para RB951 - RBM33G                                                               ##
## Ingeniero Andres Aguillon                                                                          ##
## 21 de enero del 2021                                                                               ##
######################################################################################################## 
#Captura el array donde esta contenido el GW de cada enlace
:global GWPP [/ip route get [/ip route find where dst-address=143.0.95.225/32]];
:global GWBK [/ip route get [/ip route find where dst-address=143.0.95.226/32]];
/
#Toma String que contiene el gateway de los enlaces
:global GWPrincipal ($GWPP->"gateway");
:global GWBackup ($GWBK->"gateway");
/
#Agrega rutas DNS OPEN DNS
:ip route add comment="DNS 3" dst-address=208.67.222.222 gateway=($GWPrincipal) scope=10 target-scope=10
:ip route add comment="DNS 4" dst-address=208.67.220.220 gateway=($GWBackup) scope=10 target-scope=10
/
#Obtiene el array donde esta contenido el DNS de cada enlace
:global OpenDNSPrincipal [/ip route get [/ip route find where dst-address=208.67.222.222/32]];
:global OpenDNSBackup [/ip route get [/ip route find where dst-address=208.67.220.220/32]];
/
#Obtiene el Sring contenido en el dst-address
:global GWPrincipalStr ($OpenDNSPrincipal->"dst-address");
:global GWBackupStr ($OpenDNSBackup->"dst-address");
/
#Elimina caracteres no necesarios
:global GWPrincipalStr [:pick $GWPrincipalStr 0 [:find $GWPrincipalStr "/32"]];
:global GWBackupStr [:pick $GWBackupStr 0 [:find $GWBackupStr "/32"]];
/
#Agrega rutas por defecto
:ip route add comment="Default route OPEN DNS Principal" dst-address=0.0.0.0/0 gateway=($GWPrincipalStr) distance=3 scope=30 target-scope=10
:ip route add comment="Default route OPEN DNS Backup" dst-address=0.0.0.0/0 gateway=($GWBackupStr) distance=4 scope=30 target-scope=10
/
#Agrega Rutas DNS Google si es RBM33G con LTE
:ip route add comment="DNS 3" dst-address=208.67.222.222 gateway=HITPP scope=10 target-scope=10
:ip route add comment="DNS 4" dst-address=208.67.220.220 gateway=HITBK scope=10 target-scope=10
:set GWPP; :set GWBK; :set GWPrincipal; :set GWBackup; :set OpenDNSPrincipal; :set OpenDNSBackup; :set GWPrincipalStr; :set GWBackupStr;
/