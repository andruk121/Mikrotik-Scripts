###############################################################################################
## Script que comprueba duplicidad y elimina reglas duplicadas, y las acomoda adecuadamente  ##
## Ingeniero Andres Aguillon                                                                 ##
## 20 de marzo del 2021                                                                      ##
## Archivo FWAppl.rsc son politicas de FW para permitir IP´s de Colombia, Chile y Perú       ##
##                                                                                           ##
## Nota: Para aplicar Script es necesario libera memoria ram del Mikrotik                    ##
###############################################################################################
/ip firewall address-list disable [find ]
import FWAppl.rsc verbose=yes
/ip firewall filter
#********************* Desabilita regla de drop conexiones tipo input ********************* 
disable [find action=drop chain=input comment~"Resto"]   
#********************* Conexiones IP´s Permitidas *********************
:global A [:toarray [find action=accept chain=input src-address-list~"Permitidas"]]
remove numbers=($A->0)
move [find action=accept chain=input src-address-list~"Permitidas"] destination=1
#********************* Conexiones establecidad tipo input-output-forward ********************* 
move [find action=accept chain=input connection-state="established,related"] destination=1
:global A [:toarray [find action=accept chain=input connection-state="established,related"]]
remove numbers=($A->0)
move [find action=accept chain=forward connection-state="established,related"] destination=1
:global A [:toarray [find action=accept chain=forward connection-state="established,related"]]
remove numbers=($A->1)
move [find action=accept chain=output connection-state="established,related"] destination=1
#********************* Conexiones Fasttrack ********************* 
move [find comment~"Fasttrack" action=fasttrack-connection] destination=1
#********************* Conexiones protocolo IPSEC ********************* 
move [find action=accept chain=input protocol="i
sec-esp"] destination=1
:global A [:toarray [find action=accept chain=input protocol="ipsec-esp"]]
remove numbers=($A->1)
move [find action=accept chain=input protocol="ipsec-ah"] destination=1
:global A [:toarray [find action=accept chain=input protocol="ipsec-ah"]]
remove numbers=($A->1)
move [find action=accept chain=input protocol="udp" dst-port="500,4500"] destination=1
:global A [:toarray [find action=accept chain=input protocol="udp" dst-port="500,4500"]]
remove numbers=($A->1)
move [find action=accept chain=input protocol="udp" dst-port="9093"] destination=1
:global A [:toarray [find action=accept chain=input protocol="udp" dst-port="9093"]]
remove numbers=($A->1)
move [find action=accept chain=input protocol="tcp" dst-port="9093"] destination=1
:global A [:toarray [find action=accept chain=input protocol="tcp" dst-port="9093"]]
remove numbers=($A->1)
#********************* Conexiones protocolo PPTP ********************* 
move [find action=accept chain=input protocol="tcp" dst-port="1723"] destination=1
:global A [:toarray [find action=accept chain=input protocol="tcp" dst-port="1723"]]
remove numbers=($A->1)
#********************* Conexiones protocolo L2TP ********************* 
move [find action=accept chain=input protocol="udp" dst-port="1701"] destination=1
:global A [:toarray [find action=accept chain=input protocol="udp" dst-port="1701"]]
remove numbers=($A->1)
move [find action=accept chain=input protocol="tcp" dst-port="1701"] destination=1
#********************* Conexiones protocolo Gre ********************* 
move [find action=accept chain=input protocol="gre"] destination=1
:global A [:toarray [find action=accept chain=input protocol="gre"]]
remove numbers=($A->1)
#********************* Conexiones protocolo OVPN ********************* 
move [find action=accept chain=input protocol="tcp" dst-port="1194"] destination=1
:global A [:toarray [find action=accept chain=input protocol="tcp" dst-port="1194"]]
remove numbers=($A->1)
#*******************************************************************************
#******************************** NO VALIDA DUPLICADAS *************************
#*******************************************************************************
move [find action=accept chain=input protocol="tcp" dst-port="8081"] destination=1
#********************* Conexiones SrcAddresList Colombia_IP ********************* 
move [find action=accept chain=input src-address-list="Colombia_IP" protocol="tcp"] destination=1
move [find action=accept chain=input src-address-list="Colombia_IP" protocol="udp"] destination=1
move [find action=accept chain=input protocol="tcp" in-interface="all-ppp"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="3389"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="21"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="514"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="10080"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="443"] destination=1
move [find action=accept chain=input protocol="tcp" dst-port="2211"] destination=1
move [find action=accept chain=input protocol="udp" dst-port="2000"] destination=1
#********************* Conexiones protocolo ICMP ********************* 
move [find chain=icmp] destination=1
:global A [:toarray [find chain=icmp]]
remove numbers=($A->0)
remove numbers=($A->1)
remove numbers=($A->2)
remove numbers=($A->3)
remove numbers=($A->4)
remove numbers=($A->5)
move [find action=jump protocol="icmp"] destination=1
:global A [:toarray [ find action=jump protocol="icmp"]]
remove numbers=($A->1)
remove numbers=($A->3)
#*********************** Reglas de Foward ****************************
# Escritorio remoto
move [find action=accept chain=forward port="445"] destination=1
:global A [:toarray [find action=accept chain=forward port="445"]]
emove numbers=($A->1)
move [find action=accept chain=forward src-address-list="ipNavegacion"] destination=1
:global A [:toarray [find action=accept chain=forward src-address-list="ipNavegacion"]]
remove numbers=($A->1)
move [find action=accept chain=forward comment~"AnyDesk"] destination=1
:global A [:toarray [find action=accept chain=forward comment~"AnyDesk"]]
remove numbers=($A->1)
move [find action=accept chain=forward dst-port="7070"] destination=1
#********************* Dropear SSH Brute Forcers ********************* 
move [find action=add-src-to-address-list chain=input protocol="tcp" dst-port="22"] destination=1
move [find action=drop chain=input src-address-list="ssh_blacklist"] destination=1
move [find action=add-src-to-address-list chain=input protocol="tcp" dst-port!="22"] destination=1
#********************* Dropear Conexiones Invalidas ********************* 
move [find action=drop connection-state="invalid"] destination=1
:global A [:toarray [find action=drop connection-state="invalid"]]
remove numbers=($A->1)
#********************* Dropear Ataques Scan Port ********************* 
move [find action=drop protocol="tcp" comment~"Scan"] destination=1
:global A [:toarray [find action=drop protocol="tcp" comment~"Scan"]]
remove numbers=($A->1)
move [find action=drop protocol="tcp" comment~"SCAN"] destination=1
:global A [:toarray [find action=drop protocol="tcp" comment~"Scan"]]
remove numbers=($A->0)
move [find action=drop protocol="udp"] destination=1
#********************* Drop Proxy WAN ********************* 
move [find action=drop chain=input protocol="tcp" dst-port="8080"] destination=1
#********************* Drop ICMP Ataque ********************* 
move [find action=drop chain=input protocol="icmp"] destination=1
#********************* Dropear To Sync Flood ********************* 
move [find action=drop chain=input src-address-list="Sync_Flooder"] destination=1
#********************* Dropear To Port Scan List ********************* 
move [find action=drop chain=input src-address-list="Port_Scanner"] destination=1
#********************* Ubica regla de drop para conediones tipo input********************* 
move [find action=drop chain=input comment~"Resto"] destination=1
:global A [:toarray [find action=drop chain=input comment~"Resto"]]
remove numbers=($A->1)
#********************* Ubica regla de drop Ataques DoS ********************* 
move [find action=tarpit] destination=1
:global A [:toarray [ find action=tarpit]]
remove numbers=($A->1)
move [find action=drop chain=forward] destination=1
move [find action=accept chain=forward connection-state!="established,related"] destination=1
:set $A
/
/user add name=AdminXXX group=full password="Password_Deseada"
/user disable admin 