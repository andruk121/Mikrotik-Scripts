###############################################################################################
## Script que ejecuta los siguientes pasos:                                                  ##
##    (1) Deshabilita Address List                                                           ##
##    (2) Deshabilita Filter rules, para conservar gestion remota                            ##
##    (3) Elimina reglas antiguas tipo input e icmp                                          ## 
##    (4) Agrega Adress list adicional para permiter IP's Colombia & Panamá                  ##
##    (5) Agrega Filter rules tipo input e icmp para robustes en el Firewall del equipo      ##
##    (6) Crea usuadio administrador deseado y deshabilita el default "admin"                ##
##    (7) Envia las reglas tipo Foward al final despues de las tipo input drop.              ##
## Ingeniero Andres Aguillon                                                                 ##
## 24 de marzo del 2021                                                                      ##
## Archivo FWAppl.rsc son politicas de FW para permitir IP´s de Colombia, Chile y Perú       ##
###############################################################################################
export file=BK_firewallNew
/ip firewall address-list disable [find ]
/ip firewall filter 
disable [find ]
remove [find chain=input action=drop]
remove [find chain=input action=accept]
remove [find chain=input]
remove [find chain="icmp"]
/ip firewall address-list
add address=172.16.180.0/26 list="Ips Permitidas Admin Router"
add address=94.26.112.150 list=BloqueoIPs
add address=85.234.125.147 list=BloqueoIPs
add address=85.234.125.0/24 list=BloqueoIPs
add address=94.26.112.0/24 list=BloqueoIPs
add address=95.100.87.0/24 list=BloqueoIPs
add address=31.13.67.0/24 list=BloqueoIPs
add address=200.14.46.80 list=BloqueoIPs
add address=223.20.0.0/15 list=BloqueoIPs
add address=223.0.0.0/8 list=BloqueoIPs
add address=223.27.184.0/22 list=BloqueoIPs
add address=223.29.208.0/22 list=BloqueoIPs
add address=223.29.252.0/22 list=BloqueoIPs
add address=223.64.0.0/10 list=BloqueoIPs
add address=223.120.128.0/17 list=BloqueoIPs
add address=92.63.0.0/16 list=BloqueoIPs
add address=223.71.0.0/16 list=BloqueoIPs
add address=42.240.0.0/16 list=BloqueoIPs
add address=89.248.0.0/16 list=BloqueoIPs
add address=42.240.129.58 list=BloqueoIPs
add address=60.191.0.0/16 list=BloqueoIPs
add address=60.191.125.35 list=BloqueoIPs
add address=139.162.0.0/16 list=BloqueoIPs
add address=139.162.102.46 list=BloqueoIPs
add address=167.71.0.0/16 list=BloqueoIPs
add address=167.71.144.4 list=BloqueoIPs
add address=178.62.0.0/16 list=BloqueoIPs
add address=178.62.69.110 list=BloqueoIPs
add address=161.35.0.0/16 list=BloqueoIPs
add address=161.35.108.76 list=BloqueoIPs
add address=176.58.0.0/16 list=BloqueoIPs
add address=176.58.125.216 list=BloqueoIPs
add address=106.75.0.0/16 list=BloqueoIPs
add address=106.75.84.197 list=BloqueoIPs
add address=122.228.0.0/16 list=BloqueoIPs
add address=122.228.19.79 list=BloqueoIPs
add address=92.63.194.0/24 list=BloqueoIPs
add address=92.63.194.35 list=BloqueoIPs
add address=89.248.168.112 list=BloqueoIPs
add address=80.82.70.118 list=BloqueoIPs
add address=80.82.0.0/16 list=BloqueoIPs
add address=83.97.0.0/16 list=BloqueoIPs
add address=83.97.20.25 list=BloqueoIPs
add address=45.5.160.0/22 list=Colombia_IP
add address=45.5.164.0/22 list=Colombia_IP
add address=45.5.172.0/22 list=Colombia_IP
add address=45.5.180.0/22 list=Colombia_IP
add address=45.5.184.0/22 list=Colombia_IP
add address=45.5.188.0/22 list=Colombia_IP
add address=45.7.132.0/22 list=Colombia_IP
add address=45.65.136.0/22 list=Colombia_IP
add address=45.65.200.0/24 list=Colombia_IP
add address=45.65.232.0/22 list=Colombia_IP
add address=45.70.168.0/22 list=Colombia_IP
add address=45.71.7.0/24 list=Colombia_IP
add address=45.71.180.0/22 list=Colombia_IP
add address=45.162.0.0/22 list=Colombia_IP
add address=45.162.76.0/22 list=Colombia_IP
add address=45.162.82.0/23 list=Colombia_IP
add address=45.162.84.0/24 list=Colombia_IP
add address=45.162.85.0/24 list=Colombia_IP
add address=45.162.126.0/24 list=Colombia_IP
add address=45.163.0.0/22 list=Colombia_IP
add address=45.163.28.0/23 list=Colombia_IP
add address=45.163.30.0/24 list=Colombia_IP
add address=45.167.124.0/23 list=Colombia_IP
add address=45.167.126.0/24 list=Colombia_IP
add address=45.167.248.0/22 list=Colombia_IP
add address=45.168.104.0/22 list=Colombia_IP
add address=45.169.98.0/23 list=Colombia_IP
add address=45.169.253.0/24 list=Colombia_IP
add address=45.170.124.0/22 list=Colombia_IP
add address=45.170.132.0/22 list=Colombia_IP
add address=45.170.240.0/22 list=Colombia_IP
add address=45.171.118.0/24 list=Colombia_IP
add address=45.171.180.0/22 list=Colombia_IP
add address=45.172.178.0/23 list=Colombia_IP
add address=45.172.184.0/22 list=Colombia_IP
add address=45.172.218.0/24 list=Colombia_IP
add address=45.172.222.0/23 list=Colombia_IP
add address=45.173.4.0/22 list=Colombia_IP
add address=45.173.8.0/22 list=Colombia_IP
add address=45.173.12.0/24 list=Colombia_IP
add address=45.173.14.0/23 list=Colombia_IP
add address=45.173.44.0/24 list=Colombia_IP
add address=45.173.68.0/22 list=Colombia_IP
add address=45.174.196.0/22 list=Colombia_IP
add address=45.174.224.0/23 list=Colombia_IP
add address=45.174.227.0/24 list=Colombia_IP
add address=45.175.20.0/24 list=Colombia_IP
add address=45.175.139.0/24 list=Colombia_IP
add address=45.176.70.0/23 list=Colombia_IP
add address=45.176.193.0/24 list=Colombia_IP
add address=45.176.232.0/22 list=Colombia_IP
add address=45.177.52.0/23 list=Colombia_IP
add address=45.177.54.0/24 list=Colombia_IP
add address=45.177.108.0/22 list=Colombia_IP
add address=45.178.4.0/22 list=Colombia_IP
add address=45.178.12.0/22 list=Colombia_IP
add address=45.178.64.0/22 list=Colombia_IP
add address=45.179.160.0/22 list=Colombia_IP
add address=45.179.200.0/22 list=Colombia_IP
add address=45.179.244.0/22 list=Colombia_IP
add address=45.180.22.0/23 list=Colombia_IP
add address=45.180.44.0/24 list=Colombia_IP
add address=45.180.82.0/23 list=Colombia_IP
add address=45.180.112.0/24 list=Colombia_IP
add address=45.181.156.0/22 list=Colombia_IP
add address=45.181.188.0/22 list=Colombia_IP
add address=45.181.204.0/23 list=Colombia_IP
add address=45.181.206.0/23 list=Colombia_IP
add address=45.182.41.0/24 list=Colombia_IP
add address=45.182.190.0/23 list=Colombia_IP
add address=45.183.40.0/24 list=Colombia_IP
add address=45.183.196.0/22 list=Colombia_IP
add address=45.183.247.0/24 list=Colombia_IP
add address=45.185.31.0/24 list=Colombia_IP
add address=45.187.48.0/22 list=Colombia_IP
add address=45.224.186.0/24 list=Colombia_IP
add address=45.225.224.0/22 list=Colombia_IP
add address=45.226.112.0/22 list=Colombia_IP
add address=45.226.186.0/23 list=Colombia_IP
add address=45.227.5.0/24 list=Colombia_IP
add address=45.227.88.0/22 list=Colombia_IP
add address=45.229.72.0/23 list=Colombia_IP
add address=45.229.192.0/23 list=Colombia_IP
add address=45.230.33.0/24 list=Colombia_IP
add address=45.231.184.0/22 list=Colombia_IP
add address=45.233.4.0/22 list=Colombia_IP
add address=45.233.72.0/22 list=Colombia_IP
add address=45.233.168.0/22 list=Colombia_IP
add address=45.235.40.0/22 list=Colombia_IP
add address=45.237.36.0/22 list=Colombia_IP
add address=45.238.144.0/22 list=Colombia_IP
add address=45.238.180.0/22 list=Colombia_IP
add address=45.238.196.0/22 list=Colombia_IP
add address=45.239.88.0/22 list=Colombia_IP
add address=45.239.115.0/24 list=Colombia_IP
add address=66.231.64.0/20 list=Colombia_IP
add address=131.0.136.0/22 list=Colombia_IP
add address=131.0.168.0/22 list=Colombia_IP
add address=131.108.168.0/22 list=Colombia_IP
add address=131.196.208.0/22 list=Colombia_IP
add address=131.196.212.0/22 list=Colombia_IP
add address=131.221.40.0/22 list=Colombia_IP
add address=132.255.20.0/22 list=Colombia_IP
add address=138.0.40.0/22 list=Colombia_IP
add address=138.0.88.0/22 list=Colombia_IP
add address=138.0.116.0/22 list=Colombia_IP
add address=138.36.64.0/22 list=Colombia_IP
add address=138.94.0.0/22 list=Colombia_IP
add address=138.97.56.0/22 list=Colombia_IP
add address=138.97.80.0/22 list=Colombia_IP
add address=138.117.40.0/22 list=Colombia_IP
add address=138.117.84.0/22 list=Colombia_IP
add address=138.117.108.0/22 list=Colombia_IP
add address=138.117.136.0/22 list=Colombia_IP
add address=138.121.4.0/22 list=Colombia_IP
add address=138.121.12.0/22 list=Colombia_IP
add address=138.121.156.0/22 list=Colombia_IP
add address=138.121.200.0/22 list=Colombia_IP
add address=138.122.200.0/22 list=Colombia_IP
add address=138.186.20.0/22 list=Colombia_IP
add address=138.186.188.0/22 list=Colombia_IP
add address=138.204.236.0/22 list=Colombia_IP
add address=143.0.92.0/22 list=Colombia_IP
add address=143.0.102.0/23 list=Colombia_IP
add address=143.0.108.0/22 list=Colombia_IP
add address=143.137.96.0/22 list=Colombia_IP
add address=143.208.64.0/22 list=Colombia_IP
add address=152.200.0.0/14 list=Colombia_IP
add address=152.204.0.0/15 list=Colombia_IP
add address=152.231.24.0/21 list=Colombia_IP
add address=157.253.0.0/16 list=Colombia_IP
add address=161.10.0.0/16 list=Colombia_IP
add address=161.18.0.0/16 list=Colombia_IP
add address=167.0.0.0/16 list=Colombia_IP
add address=167.249.40.0/22 list=Colombia_IP
add address=167.250.120.0/22 list=Colombia_IP
add address=168.0.244.0/22 list=Colombia_IP
add address=168.90.12.0/22 list=Colombia_IP
add address=168.176.0.0/16 list=Colombia_IP
add address=168.197.68.0/22 list=Colombia_IP
add address=168.227.0.0/22 list=Colombia_IP
add address=168.227.104.0/22 list=Colombia_IP
add address=168.227.244.0/22 list=Colombia_IP
add address=168.228.108.0/22 list=Colombia_IP
add address=168.228.124.0/22 list=Colombia_IP
add address=170.78.40.0/22 list=Colombia_IP
add address=170.78.56.0/22 list=Colombia_IP
add address=170.78.185.0/24 list=Colombia_IP
add address=170.79.88.0/22 list=Colombia_IP
add address=170.80.8.0/22 list=Colombia_IP
add address=170.80.96.0/22 list=Colombia_IP
add address=170.81.24.0/22 list=Colombia_IP
add address=170.81.252.0/22 list=Colombia_IP
add address=170.82.40.0/23 list=Colombia_IP
add address=170.83.59.0/24 list=Colombia_IP
add address=170.238.64.0/23 list=Colombia_IP
add address=170.238.168.0/23 list=Colombia_IP
add address=170.238.226.0/23 list=Colombia_IP
add address=170.238.236.0/22 list=Colombia_IP
add address=170.245.158.0/23 list=Colombia_IP
add address=170.246.112.0/22 list=Colombia_IP
add address=170.247.0.0/22 list=Colombia_IP
add address=170.254.0.0/22 list=Colombia_IP
add address=170.254.228.0/22 list=Colombia_IP
add address=177.252.0.0/14 list=Colombia_IP
add address=179.0.9.0/24 list=Colombia_IP
add address=179.0.10.0/24 list=Colombia_IP
add address=179.0.15.0/24 list=Colombia_IP
add address=179.0.27.0/24 list=Colombia_IP
add address=179.0.29.0/24 list=Colombia_IP
add address=179.0.146.0/24 list=Colombia_IP
add address=179.0.205.0/24 list=Colombia_IP
add address=179.1.0.0/16 list=Colombia_IP
add address=179.12.0.0/14 list=Colombia_IP
add address=179.18.0.0/15 list=Colombia_IP
add address=179.32.0.0/15 list=Colombia_IP
add address=179.42.172.0/22 list=Colombia_IP
add address=179.43.104.0/22 list=Colombia_IP
add address=179.43.108.0/22 list=Colombia_IP
add address=179.50.0.0/17 list=Colombia_IP
add address=179.51.96.0/19 list=Colombia_IP
add address=179.60.32.0/20 list=Colombia_IP
add address=179.60.240.0/22 list=Colombia_IP
add address=179.61.112.0/20 list=Colombia_IP
add address=181.32.0.0/15 list=Colombia_IP
add address=181.48.0.0/13 list=Colombia_IP
add address=181.56.0.0/13 list=Colombia_IP
add address=181.68.0.0/15 list=Colombia_IP
add address=181.70.0.0/15 list=Colombia_IP
add address=181.118.144.0/20 list=Colombia_IP
add address=181.128.0.0/13 list=Colombia_IP
add address=181.136.0.0/13 list=Colombia_IP
add address=181.144.0.0/13 list=Colombia_IP
add address=181.152.0.0/13 list=Colombia_IP
add address=181.174.0.0/18 list=Colombia_IP
add address=181.192.128.0/17 list=Colombia_IP
add address=181.199.192.0/20 list=Colombia_IP
add address=181.204.0.0/14 list=Colombia_IP
add address=181.224.160.0/22 list=Colombia_IP
add address=181.225.64.0/20 list=Colombia_IP
add address=181.225.80.0/20 list=Colombia_IP
add address=181.225.96.0/20 list=Colombia_IP
add address=181.232.0.0/17 list=Colombia_IP
add address=181.234.0.0/15 list=Colombia_IP
add address=181.236.0.0/15 list=Colombia_IP
add address=181.240.0.0/12 list=Colombia_IP
add address=186.0.0.0/18 list=Colombia_IP
add address=186.0.64.0/18 list=Colombia_IP
add address=186.1.128.0/19 list=Colombia_IP
add address=186.1.160.0/19 list=Colombia_IP
add address=186.1.248.0/21 list=Colombia_IP
add address=186.27.128.0/17 list=Colombia_IP
add address=186.28.0.0/16 list=Colombia_IP
add address=186.29.0.0/16 list=Colombia_IP
add address=186.30.0.0/16 list=Colombia_IP
add address=186.31.0.0/16 list=Colombia_IP
add address=186.43.0.0/17 list=Colombia_IP
add address=186.80.0.0/14 list=Colombia_IP
add address=186.84.0.0/14 list=Colombia_IP
add address=186.96.96.0/19 list=Colombia_IP
add address=186.97.0.0/18 list=Colombia_IP
add address=186.97.64.0/18 list=Colombia_IP
add address=186.97.128.0/17 list=Colombia_IP
add address=186.98.0.0/16 list=Colombia_IP
add address=186.99.0.0/16 list=Colombia_IP
add address=186.102.0.0/16 list=Colombia_IP
add address=186.103.0.0/17 list=Colombia_IP
add address=186.112.0.0/14 list=Colombia_IP
add address=186.116.0.0/14 list=Colombia_IP
add address=186.121.0.0/17 list=Colombia_IP
add address=186.144.0.0/14 list=Colombia_IP
add address=186.148.160.0/19 list=Colombia_IP
add address=186.154.0.0/16 list=Colombia_IP
add address=186.155.0.0/16 list=Colombia_IP
add address=186.159.0.0/18 list=Colombia_IP
add address=186.159.64.0/19 list=Colombia_IP
add address=186.159.112.0/22 list=Colombia_IP
add address=186.168.0.0/15 list=Colombia_IP
add address=186.170.0.0/15 list=Colombia_IP
add address=186.179.96.0/20 list=Colombia_IP
add address=186.180.0.0/16 list=Colombia_IP
add address=186.181.0.0/16 list=Colombia_IP
add address=186.183.128.0/17 list=Colombia_IP
add address=186.190.224.0/21 list=Colombia_IP
add address=190.0.0.0/19 list=Colombia_IP
add address=190.0.32.0/19 list=Colombia_IP
add address=190.0.240.0/21 list=Colombia_IP
add address=190.1.64.0/19 list=Colombia_IP
add address=190.1.128.0/19 list=Colombia_IP
add address=190.1.160.0/19 list=Colombia_IP
add address=190.1.192.0/19 list=Colombia_IP
add address=190.1.224.0/19 list=Colombia_IP
add address=190.2.208.0/21 list=Colombia_IP
add address=190.3.192.0/19 list=Colombia_IP
add address=190.3.224.0/19 list=Colombia_IP
add address=190.5.192.0/20 list=Colombia_IP
add address=190.6.160.0/20 list=Colombia_IP
add address=190.6.176.0/20 list=Colombia_IP
add address=190.7.64.0/20 list=Colombia_IP
add address=190.7.80.0/20 list=Colombia_IP
add address=190.7.96.0/20 list=Colombia_IP
add address=190.7.112.0/20 list=Colombia_IP
add address=190.7.128.0/20 list=Colombia_IP
add address=190.7.144.0/20 list=Colombia_IP
add address=190.8.176.0/22 list=Colombia_IP
add address=190.8.192.0/19 list=Colombia_IP
add address=190.8.224.0/19 list=Colombia_IP
add address=190.9.64.0/19 list=Colombia_IP
add address=190.9.96.0/19 list=Colombia_IP
add address=190.9.192.0/19 list=Colombia_IP
add address=190.9.224.0/19 list=Colombia_IP
add address=190.13.0.0/19 list=Colombia_IP
add address=190.13.32.0/19 list=Colombia_IP
add address=190.13.80.0/21 list=Colombia_IP
add address=190.13.96.0/20 list=Colombia_IP
add address=190.13.192.0/20 list=Colombia_IP
add address=190.14.224.0/20 list=Colombia_IP
add address=190.14.240.0/20 list=Colombia_IP
add address=190.15.0.0/19 list=Colombia_IP
add address=190.24.0.0/16 list=Colombia_IP
add address=190.25.0.0/16 list=Colombia_IP
add address=190.26.0.0/16 list=Colombia_IP
add address=190.27.0.0/16 list=Colombia_IP
add address=190.28.0.0/16 list=Colombia_IP
add address=190.29.0.0/16 list=Colombia_IP
add address=190.52.0.0/19 list=Colombia_IP
add address=190.60.0.0/16 list=Colombia_IP
add address=190.61.0.0/19 list=Colombia_IP
add address=190.61.32.0/19 list=Colombia_IP
add address=190.61.64.0/18 list=Colombia_IP
add address=190.61.128.0/17 list=Colombia_IP
add address=190.65.0.0/16 list=Colombia_IP
add address=190.66.0.0/15 list=Colombia_IP
add address=190.68.0.0/15 list=Colombia_IP
add address=190.70.0.0/17 list=Colombia_IP
add address=190.70.128.0/17 list=Colombia_IP
add address=190.71.0.0/16 list=Colombia_IP
add address=190.84.0.0/16 list=Colombia_IP
add address=190.85.0.0/16 list=Colombia_IP
add address=190.90.0.0/16 list=Colombia_IP
add address=190.93.128.0/19 list=Colombia_IP
add address=190.96.128.0/19 list=Colombia_IP
add address=190.96.160.0/19 list=Colombia_IP
add address=190.96.192.0/20 list=Colombia_IP
add address=190.96.208.0/20 list=Colombia_IP
add address=190.96.224.0/19 list=Colombia_IP
add address=190.97.64.0/20 list=Colombia_IP
add address=190.97.80.0/20 list=Colombia_IP
add address=190.97.128.0/19 list=Colombia_IP
add address=190.97.192.0/19 list=Colombia_IP
add address=190.99.128.0/17 list=Colombia_IP
add address=190.102.120.0/21 list=Colombia_IP
add address=190.102.160.0/19 list=Colombia_IP
add address=190.102.192.0/20 list=Colombia_IP
add address=190.102.208.0/20 list=Colombia_IP
add address=190.103.96.0/20 list=Colombia_IP
add address=190.103.112.0/20 list=Colombia_IP
add address=190.107.16.0/20 list=Colombia_IP
add address=190.109.128.0/19 list=Colombia_IP
add address=190.109.160.0/19 list=Colombia_IP
add address=190.110.64.0/19 list=Colombia_IP
add address=190.115.224.0/19 list=Colombia_IP
add address=190.120.128.0/20 list=Colombia_IP
add address=190.121.128.0/20 list=Colombia_IP
add address=190.121.144.0/20 list=Colombia_IP
add address=190.124.96.0/19 list=Colombia_IP
add address=190.125.0.0/16 list=Colombia_IP
add address=190.126.0.0/15 list=Colombia_IP
add address=190.128.0.0/19 list=Colombia_IP
add address=190.128.32.0/19 list=Colombia_IP
add address=190.128.64.0/18 list=Colombia_IP
add address=190.130.64.0/18 list=Colombia_IP
add address=190.131.192.0/18 list=Colombia_IP
add address=190.143.0.0/18 list=Colombia_IP
add address=190.143.64.0/18 list=Colombia_IP
add address=190.144.0.0/14 list=Colombia_IP
add address=190.151.192.0/18 list=Colombia_IP
add address=190.156.0.0/15 list=Colombia_IP
add address=190.158.0.0/15 list=Colombia_IP
add address=190.165.0.0/18 list=Colombia_IP
add address=190.165.64.0/18 list=Colombia_IP
add address=190.165.128.0/17 list=Colombia_IP
add address=190.182.0.0/18 list=Colombia_IP
add address=190.182.64.0/18 list=Colombia_IP
add address=190.184.128.0/18 list=Colombia_IP
add address=190.184.200.0/21 list=Colombia_IP
add address=190.211.140.0/22 list=Colombia_IP
add address=190.240.0.0/18 list=Colombia_IP
add address=190.240.64.0/18 list=Colombia_IP
add address=190.240.128.0/17 list=Colombia_IP
add address=190.242.0.0/16 list=Colombia_IP
add address=190.243.0.0/16 list=Colombia_IP
add address=190.248.0.0/15 list=Colombia_IP
add address=190.250.0.0/15 list=Colombia_IP
add address=190.252.0.0/14 list=Colombia_IP
add address=191.64.0.0/12 list=Colombia_IP
add address=191.88.0.0/13 list=Colombia_IP
add address=191.97.0.0/20 list=Colombia_IP
add address=191.98.0.0/17 list=Colombia_IP
add address=191.102.0.0/20 list=Colombia_IP
add address=191.102.60.0/22 list=Colombia_IP
add address=191.102.64.0/18 list=Colombia_IP
add address=191.102.192.0/19 list=Colombia_IP
add address=191.102.224.0/20 list=Colombia_IP
add address=191.103.128.0/17 list=Colombia_IP
add address=191.104.0.0/13 list=Colombia_IP
add address=191.144.0.0/12 list=Colombia_IP
add address=192.68.185.0/24 list=Colombia_IP
add address=192.92.154.0/24 list=Colombia_IP
add address=192.135.95.0/24 list=Colombia_IP
add address=192.140.124.0/23 list=Colombia_IP
add address=198.49.128.0/22 list=Colombia_IP
add address=198.51.71.0/24 list=Colombia_IP
add address=200.0.0.0/21 list=Colombia_IP
add address=200.0.187.0/24 list=Colombia_IP
add address=200.0.201.0/24 list=Colombia_IP
add address=200.1.64.0/19 list=Colombia_IP
add address=200.1.96.0/21 list=Colombia_IP
add address=200.1.124.0/24 list=Colombia_IP
add address=200.1.126.0/24 list=Colombia_IP
add address=200.1.127.0/24 list=Colombia_IP
add address=200.1.173.0/24 list=Colombia_IP
add address=200.1.175.0/24 list=Colombia_IP
add address=200.1.192.0/21 list=Colombia_IP
add address=200.2.64.0/21 list=Colombia_IP
add address=200.3.128.0/20 list=Colombia_IP
add address=200.3.144.0/23 list=Colombia_IP
add address=200.3.147.0/24 list=Colombia_IP
add address=200.3.148.0/22 list=Colombia_IP
add address=200.3.152.0/22 list=Colombia_IP
add address=200.3.156.0/22 list=Colombia_IP
add address=200.3.160.0/21 list=Colombia_IP
add address=200.3.192.0/23 list=Colombia_IP
add address=200.3.244.0/22 list=Colombia_IP
add address=200.4.16.0/20 list=Colombia_IP
add address=200.6.160.0/20 list=Colombia_IP
add address=200.6.176.0/20 list=Colombia_IP
add address=200.9.72.0/24 list=Colombia_IP
add address=200.9.94.0/24 list=Colombia_IP
add address=200.9.158.0/23 list=Colombia_IP
add address=200.10.136.0/23 list=Colombia_IP
add address=200.10.154.0/24 list=Colombia_IP
add address=200.10.164.0/24 list=Colombia_IP
add address=200.10.174.0/23 list=Colombia_IP
add address=200.11.40.0/21 list=Colombia_IP
add address=200.12.170.0/24 list=Colombia_IP
add address=200.12.175.0/24 list=Colombia_IP
add address=200.12.176.0/20 list=Colombia_IP
add address=200.13.192.0/19 list=Colombia_IP
add address=200.13.224.0/19 list=Colombia_IP
add address=200.14.40.0/21 list=Colombia_IP
add address=200.14.112.0/23 list=Colombia_IP
add address=200.16.68.0/22 list=Colombia_IP
add address=200.16.79.0/24 list=Colombia_IP
add address=200.16.117.0/24 list=Colombia_IP
add address=200.16.118.0/23 list=Colombia_IP
add address=200.21.0.0/16 list=Colombia_IP
add address=200.23.115.0/24 list=Colombia_IP
add address=200.24.0.0/21 list=Colombia_IP
add address=200.24.8.0/24 list=Colombia_IP
add address=200.24.9.0/24 list=Colombia_IP
add address=200.24.16.0/20 list=Colombia_IP
add address=200.24.32.0/20 list=Colombia_IP
add address=200.24.48.0/20 list=Colombia_IP
add address=200.24.96.0/20 list=Colombia_IP
add address=200.24.112.0/20 list=Colombia_IP
add address=200.25.0.0/17 list=Colombia_IP
add address=200.25.224.0/20 list=Colombia_IP
add address=200.25.240.0/20 list=Colombia_IP
add address=200.26.128.0/19 list=Colombia_IP
add address=200.29.96.0/20 list=Colombia_IP
add address=200.29.112.0/20 list=Colombia_IP
add address=200.29.232.0/21 list=Colombia_IP
add address=200.30.64.0/20 list=Colombia_IP
add address=200.30.80.0/20 list=Colombia_IP
add address=200.30.96.0/19 list=Colombia_IP
add address=200.31.64.0/19 list=Colombia_IP
add address=200.31.192.0/20 list=Colombia_IP
add address=200.31.208.0/20 list=Colombia_IP
add address=200.34.0.0/24 list=Colombia_IP
add address=200.34.171.0/24 list=Colombia_IP
add address=200.35.32.0/20 list=Colombia_IP
add address=200.35.48.0/20 list=Colombia_IP
add address=200.47.172.0/22 list=Colombia_IP
add address=200.47.216.0/22 list=Colombia_IP
add address=200.58.192.0/20 list=Colombia_IP
add address=200.58.208.0/20 list=Colombia_IP
add address=200.58.224.0/20 list=Colombia_IP
add address=200.61.128.0/19 list=Colombia_IP
add address=200.69.64.0/19 list=Colombia_IP
add address=200.69.96.0/20 list=Colombia_IP
add address=200.69.112.0/20 list=Colombia_IP
add address=200.71.32.0/20 list=Colombia_IP
add address=200.71.48.0/20 list=Colombia_IP
add address=200.73.0.0/18 list=Colombia_IP
add address=200.73.64.0/19 list=Colombia_IP
add address=200.74.128.0/19 list=Colombia_IP
add address=200.75.32.0/19 list=Colombia_IP
add address=200.75.64.0/19 list=Colombia_IP
add address=200.80.0.0/18 list=Colombia_IP
add address=200.81.56.0/21 list=Colombia_IP
add address=200.85.224.0/20 list=Colombia_IP
add address=200.85.240.0/20 list=Colombia_IP
add address=200.89.96.0/20 list=Colombia_IP
add address=200.89.112.0/20 list=Colombia_IP
add address=200.89.192.0/20 list=Colombia_IP
add address=200.89.208.0/20 list=Colombia_IP
add address=200.89.224.0/20 list=Colombia_IP
add address=200.89.240.0/20 list=Colombia_IP
add address=200.91.192.0/19 list=Colombia_IP
add address=200.91.224.0/19 list=Colombia_IP
add address=200.93.128.0/19 list=Colombia_IP
add address=200.93.160.0/19 list=Colombia_IP
add address=200.110.128.0/19 list=Colombia_IP
add address=200.110.168.0/21 list=Colombia_IP
add address=200.112.192.0/20 list=Colombia_IP
add address=200.112.208.0/21 list=Colombia_IP
add address=200.114.0.0/20 list=Colombia_IP
add address=200.114.16.0/20 list=Colombia_IP
add address=200.114.32.0/19 list=Colombia_IP
add address=200.115.178.0/24 list=Colombia_IP
add address=200.115.180.0/24 list=Colombia_IP
add address=200.115.181.0/24 list=Colombia_IP
add address=200.116.0.0/17 list=Colombia_IP
add address=200.116.128.0/17 list=Colombia_IP
add address=200.118.0.0/17 list=Colombia_IP
add address=200.118.128.0/17 list=Colombia_IP
add address=200.119.0.0/19 list=Colombia_IP
add address=200.119.32.0/19 list=Colombia_IP
add address=200.119.64.0/18 list=Colombia_IP
add address=200.122.192.0/19 list=Colombia_IP
add address=200.122.224.0/20 list=Colombia_IP
add address=200.122.240.0/20 list=Colombia_IP
add address=200.124.124.0/23 list=Colombia_IP
add address=200.192.106.0/24 list=Colombia_IP
add address=201.130.16.0/22 list=Colombia_IP
add address=201.131.46.0/24 list=Colombia_IP
add address=201.131.78.0/24 list=Colombia_IP
add address=201.131.90.0/23 list=Colombia_IP
add address=201.131.97.0/24 list=Colombia_IP
add address=201.131.114.0/24 list=Colombia_IP
add address=201.131.188.0/22 list=Colombia_IP
add address=201.150.96.0/22 list=Colombia_IP
add address=201.182.248.0/22 list=Colombia_IP
add address=201.184.0.0/15 list=Colombia_IP
add address=201.190.64.0/18 list=Colombia_IP
add address=201.216.0.0/19 list=Colombia_IP
add address=201.216.32.0/19 list=Colombia_IP
add address=201.217.192.0/19 list=Colombia_IP
add address=201.219.112.0/20 list=Colombia_IP
add address=201.219.192.0/19 list=Colombia_IP
add address=201.219.240.0/21 list=Colombia_IP
add address=201.220.30.0/23 list=Colombia_IP
add address=201.220.32.0/20 list=Colombia_IP
add address=201.220.48.0/20 list=Colombia_IP
add address=201.220.64.0/20 list=Colombia_IP
add address=201.220.80.0/20 list=Colombia_IP
add address=201.221.122.0/24 list=Colombia_IP
add address=201.221.124.0/23 list=Colombia_IP
add address=201.221.128.0/20 list=Colombia_IP
add address=201.221.144.0/20 list=Colombia_IP
add address=201.221.160.0/20 list=Colombia_IP
add address=201.221.176.0/20 list=Colombia_IP
add address=201.228.0.0/17 list=Colombia_IP
add address=201.228.128.0/17 list=Colombia_IP
add address=201.232.0.0/17 list=Colombia_IP
add address=201.232.128.0/17 list=Colombia_IP
add address=201.233.0.0/17 list=Colombia_IP
add address=201.233.128.0/17 list=Colombia_IP
add address=201.236.192.0/19 list=Colombia_IP
add address=201.236.224.0/19 list=Colombia_IP
add address=201.244.0.0/16 list=Colombia_IP
add address=201.245.0.0/16 list=Colombia_IP
add address=206.223.124.0/24 list=Colombia_IP
add address=207.248.81.0/24 list=Colombia_IP
add address=216.241.0.0/19 list=Colombia_IP
add address=38.108.33.0/24 list=Colombia_IP
add address=45.229.197.0/24 list=Colombia_IP
add address=45.232.92.0/24 list=Colombia_IP
add address=132.191.2.0/24 list=Colombia_IP
add address=138.0.118.0/24 list=Colombia_IP
add address=148.102.113.0/24 list=Colombia_IP
add address=168.90.12.0/24 list=Colombia_IP
add address=168.197.68.0/24 list=Colombia_IP
add address=177.238.121.0/24 list=Colombia_IP
add address=177.248.139.0/24 list=Colombia_IP
add address=177.254.35.0/24 list=Colombia_IP
add address=191.76.195.0/24 list=Colombia_IP
add address=191.95.16.0/24 list=Colombia_IP
add address=191.95.19.0/24 list=Colombia_IP
add address=191.106.0.0/16 list=Colombia_IP
add address=191.156.0.0/16 list=Colombia_IP
add address=200.29.0.0/16 list=Colombia_IP
add address=200.6.0.0/16 list=Colombia_IP
add address=200.46.0.0/16 list=Colombia_IP
add address=200.60.0.0/16 list=Colombia_IP
add address=200.68.0.0/16 list=Colombia_IP
add address=200.71.0.0/16 list=Colombia_IP
add address=200.75.0.0/16 list=Colombia_IP
add address=200.111.0.0/16 list=Colombia_IP
add address=200.112.0.0/16 list=Colombia_IP
add address=200.114.0.0/16 list=Colombia_IP
add address=200.124.0.0/16 list=Colombia_IP
add address=200.163.0.0/16 list=Colombia_IP
add address=200.184.0.0/16 list=Colombia_IP
add address=201.218.0.0/16 list=Colombia_IP
add address=201.219.0.0/16 list=Colombia_IP
add address=201.227.0.0/16 list=Colombia_IP
add address=201.228.0.0/16 list=Colombia_IP
add address=35.170.234.0/24 list=Colombia_IP
add address=103.86.96.0/22 comment=PANAMA list=Colombia_IP
add address=116.204.192.0/22 comment=PANAMA list=Colombia_IP
add address=45.65.254.0/23 comment=PANAMA list=Colombia_IP
add address=45.169.96.0/24 comment=PANAMA list=Colombia_IP
add address=45.180.20.0/23 comment=PANAMA list=Colombia_IP
add address=45.181.68.0/22 comment=PANAMA list=Colombia_IP
add address=45.182.189.0/24 comment=PANAMA list=Colombia_IP
add address=45.183.41.0/24 comment=PANAMA list=Colombia_IP
add address=45.185.128.0/22 comment=PANAMA list=Colombia_IP
add address=45.225.70.0/23 comment=PANAMA list=Colombia_IP
add address=45.225.74.0/24 comment=PANAMA list=Colombia_IP
add address=45.225.135.0/24 comment=PANAMA list=Colombia_IP
add address=45.227.252.0/22 comment=PANAMA list=Colombia_IP
add address=45.229.56.0/22 comment=PANAMA list=Colombia_IP
add address=45.229.196.0/22 comment=PANAMA list=Colombia_IP
add address=45.235.227.0/24 comment=PANAMA list=Colombia_IP
add address=45.237.184.0/22 comment=PANAMA list=Colombia_IP
add address=131.72.224.0/22 comment=PANAMA list=Colombia_IP
add address=131.100.0.0/22 comment=PANAMA list=Colombia_IP
add address=131.108.4.0/22 comment=PANAMA list=Colombia_IP
add address=131.108.20.0/22 comment=PANAMA list=Colombia_IP
add address=131.221.24.0/22 comment=PANAMA list=Colombia_IP
add address=138.99.136.0/22 comment=PANAMA list=Colombia_IP
add address=138.99.144.0/22 comment=PANAMA list=Colombia_IP
add address=138.118.124.0/22 comment=PANAMA list=Colombia_IP
add address=138.186.12.0/22 comment=PANAMA list=Colombia_IP
add address=138.186.88.0/22 comment=PANAMA list=Colombia_IP
add address=138.204.108.0/22 comment=PANAMA list=Colombia_IP
add address=143.202.152.0/22 comment=PANAMA list=Colombia_IP
add address=143.255.156.0/22 comment=PANAMA list=Colombia_IP
add address=160.20.246.0/24 comment=PANAMA list=Colombia_IP
add address=164.163.8.0/22 comment=PANAMA list=Colombia_IP
add address=164.163.244.0/22 comment=PANAMA list=Colombia_IP
add address=167.250.112.0/22 comment=PANAMA list=Colombia_IP
add address=168.77.0.0/16 comment=PANAMA list=Colombia_IP
add address=168.121.128.0/22 comment=PANAMA list=Colombia_IP
add address=168.205.8.0/22 comment=PANAMA list=Colombia_IP
add address=170.79.108.0/22 comment=PANAMA list=Colombia_IP
add address=170.82.247.0/24 comment=PANAMA list=Colombia_IP
add address=170.231.236.0/22 comment=PANAMA list=Colombia_IP
add address=170.246.220.0/22 comment=PANAMA list=Colombia_IP
add address=170.247.152.0/22 comment=PANAMA list=Colombia_IP
add address=170.254.48.0/22 comment=PANAMA list=Colombia_IP
add address=179.0.194.0/23 comment=PANAMA list=Colombia_IP
add address=179.0.200.0/23 comment=PANAMA list=Colombia_IP
add address=179.43.128.0/18 comment=PANAMA list=Colombia_IP
add address=179.63.192.0/21 comment=PANAMA list=Colombia_IP
add address=181.38.0.0/16 comment=PANAMA list=Colombia_IP
add address=181.174.164.0/22 comment=PANAMA list=Colombia_IP
add address=181.178.0.0/16 comment=PANAMA list=Colombia_IP
add address=181.179.0.0/17 comment=PANAMA list=Colombia_IP
add address=181.179.128.0/17 comment=PANAMA list=Colombia_IP
add address=181.197.0.0/17 comment=PANAMA list=Colombia_IP
add address=181.197.128.0/18 comment=PANAMA list=Colombia_IP
add address=181.224.128.0/19 comment=PANAMA list=Colombia_IP
add address=186.5.128.0/19 comment=PANAMA list=Colombia_IP
add address=186.72.0.0/15 comment=PANAMA list=Colombia_IP
add address=186.74.0.0/15 comment=PANAMA list=Colombia_IP
add address=186.148.96.0/20 comment=PANAMA list=Colombia_IP
add address=186.159.116.0/22 comment=PANAMA list=Colombia_IP
add address=186.179.112.0/20 comment=PANAMA list=Colombia_IP
add address=186.188.128.0/17 comment=PANAMA list=Colombia_IP
add address=186.190.208.0/20 comment=PANAMA list=Colombia_IP
add address=190.2.224.0/20 comment=PANAMA list=Colombia_IP
add address=190.5.224.0/20 comment=PANAMA list=Colombia_IP
add address=190.5.240.0/20 comment=PANAMA list=Colombia_IP
add address=190.9.32.0/20 comment=PANAMA list=Colombia_IP
add address=190.14.36.0/22 comment=PANAMA list=Colombia_IP
add address=190.14.192.0/20 comment=PANAMA list=Colombia_IP
add address=190.14.208.0/21 comment=PANAMA list=Colombia_IP
add address=190.14.216.0/21 comment=PANAMA list=Colombia_IP
add address=190.32.0.0/16 comment=PANAMA list=Colombia_IP
add address=190.33.0.0/16 comment=PANAMA list=Colombia_IP
add address=190.34.0.0/15 comment=PANAMA list=Colombia_IP
add address=190.57.32.0/20 comment=PANAMA list=Colombia_IP
add address=190.97.160.0/21 comment=PANAMA list=Colombia_IP
add address=190.102.56.0/21 comment=PANAMA list=Colombia_IP
add address=190.105.152.0/22 comment=PANAMA list=Colombia_IP
add address=190.105.168.0/22 comment=PANAMA list=Colombia_IP
add address=190.109.0.0/19 comment=PANAMA list=Colombia_IP
add address=190.114.0.0/19 comment=PANAMA list=Colombia_IP
add address=190.122.160.0/20 comment=PANAMA list=Colombia_IP
add address=190.122.188.0/22 comment=PANAMA list=Colombia_IP
add address=190.123.44.0/22 comment=PANAMA list=Colombia_IP
add address=190.123.224.0/20 comment=PANAMA list=Colombia_IP
add address=190.140.0.0/16 comment=PANAMA list=Colombia_IP
add address=190.141.0.0/16 comment=PANAMA list=Colombia_IP
add address=190.211.252.0/22 comment=PANAMA list=Colombia_IP
add address=190.218.0.0/16 comment=PANAMA list=Colombia_IP
add address=190.219.0.0/16 comment=PANAMA list=Colombia_IP
add address=191.97.20.0/22 comment=PANAMA list=Colombia_IP
add address=191.98.196.0/22 comment=PANAMA list=Colombia_IP
add address=199.26.234.0/24 comment=PANAMA list=Colombia_IP
add address=200.0.178.0/24 comment=PANAMA list=Colombia_IP
add address=200.3.200.0/21 comment=PANAMA list=Colombia_IP
add address=200.6.52.0/24 comment=PANAMA list=Colombia_IP
add address=200.6.79.0/24 comment=PANAMA list=Colombia_IP
add address=200.6.152.0/21 comment=PANAMA list=Colombia_IP
add address=200.7.96.0/20 comment=PANAMA list=Colombia_IP
add address=200.10.15.0/24 comment=PANAMA list=Colombia_IP
add address=200.10.144.0/24 comment=PANAMA list=Colombia_IP
add address=200.10.203.0/24 comment=PANAMA list=Colombia_IP
add address=200.12.208.0/21 comment=PANAMA list=Colombia_IP
add address=200.14.119.0/24 comment=PANAMA list=Colombia_IP
add address=200.33.125.0/24 comment=PANAMA list=Colombia_IP
add address=200.46.0.0/17 comment=PANAMA list=Colombia_IP
add address=200.46.128.0/19 comment=PANAMA list=Colombia_IP
add address=200.46.160.0/20 comment=PANAMA list=Colombia_IP
add address=200.46.176.0/20 comment=PANAMA list=Colombia_IP
add address=200.46.192.0/20 comment=PANAMA list=Colombia_IP
add address=200.46.208.0/20 comment=PANAMA list=Colombia_IP
add address=200.46.224.0/19 comment=PANAMA list=Colombia_IP
add address=200.63.40.0/21 comment=PANAMA list=Colombia_IP
add address=200.74.240.0/21 comment=PANAMA list=Colombia_IP
add address=200.75.192.0/19 comment=PANAMA list=Colombia_IP
add address=200.75.224.0/20 comment=PANAMA list=Colombia_IP
add address=200.75.240.0/20 comment=PANAMA list=Colombia_IP
add address=200.90.128.0/20 comment=PANAMA list=Colombia_IP
add address=200.108.32.0/20 comment=PANAMA list=Colombia_IP
add address=200.108.48.0/20 comment=PANAMA list=Colombia_IP
add address=200.115.19.0/24 comment=PANAMA list=Colombia_IP
add address=200.115.128.0/20 comment=PANAMA list=Colombia_IP
add address=200.115.144.0/20 comment=PANAMA list=Colombia_IP
add address=200.115.160.0/20 comment=PANAMA list=Colombia_IP
add address=200.115.177.0/24 comment=PANAMA list=Colombia_IP
add address=200.124.0.0/20 comment=PANAMA list=Colombia_IP
add address=200.124.16.0/20 comment=PANAMA list=Colombia_IP
add address=200.124.127.0/24 comment=PANAMA list=Colombia_IP
add address=201.131.49.0/24 comment=PANAMA list=Colombia_IP
add address=201.131.148.0/22 comment=PANAMA list=Colombia_IP
add address=201.218.64.0/19 comment=PANAMA list=Colombia_IP
add address=201.218.96.0/19 comment=PANAMA list=Colombia_IP
add address=201.218.192.0/19 comment=PANAMA list=Colombia_IP
add address=201.218.224.0/19 comment=PANAMA list=Colombia_IP
add address=201.221.224.0/20 comment=PANAMA list=Colombia_IP
add address=201.221.240.0/20 comment=PANAMA list=Colombia_IP
add address=201.224.0.0/16 comment=PANAMA list=Colombia_IP
add address=201.225.0.0/16 comment=PANAMA list=Colombia_IP
add address=201.226.0.0/16 comment=PANAMA list=Colombia_IP
add address=206.224.32.0/19 comment=PANAMA list=Colombia_IP
add address=141.98.80.0/22 comment=PANAMA list=Colombia_IP
add address=195.189.242.0/23 comment=PANAMA list=Colombia_IP
add address=190.144.55.77 comment=COLOMBIA list=Colombia_IP
add address=200.122.225.34 comment=COLOMBIA list=Colombia_IP
add address=177.107.194.16/28 comment=BRASIL list=Colombia_IP
add address=107.6.183.226 list=BloqueoIPs
add address=92.0.0.0/8 list=BloqueoIPs
add address=60.191.0.0/24 list=BloqueoIPs
add address=60.191.52.0/24 list=BloqueoIPs
add address=125.64.0.0/16 list=BloqueoIPs
add address=117.157.71.16 list=BloqueoIPs
add address=117.157.0.0/16 list=BloqueoIPs
add address=5.61.28.0/24 list=BloqueoIPs
add address=5.61.28.203 list=BloqueoIPs
add address=180.214.238.174 list=BloqueoIPs
add address=180.214.238.0/24 list=BloqueoIPs
add address=87.251.70.16 list=BloqueoIPs
add address=188.166.118.238 list=BloqueoIPs
add address=196.52.43.117 list=BloqueoIPs
add address=92.63.194.111 list=BloqueoIPs
add address=27.115.124.10 list=BloqueoIPs
add address=27.115.0.0/16 list=BloqueoIPs
add address=83.97.20.35 list=BloqueoIPs
add address=83.0.0.0/8 list=BloqueoIPs
add address=107.6.171.130 list=BloqueoIPs
add address=107.6.171.0/24 list=BloqueoIPs
add address=94.232.40.0/24 list=BloqueoIPs
add address=94.102.50.103 list=BloqueoIPs
add address=94.102.50.0/24 list=BloqueoIPs
add address=94.232.42.0/24 list=BloqueoIPs
add address=194.61.26.0/24 list=BloqueoIPs
add address=194.61.26.211 list=BloqueoIPs
/ip firewall filter
add action=drop chain=forward comment="Bloqueo Lista Negra" src-address-list=BloqueoIPs disabled=yes
add action=drop chain=forward dst-address-list=BloqueoIPs disabled=yes
add action=accept chain=input comment="Accept To Established Connections" connection-state=established,related
add action=accept chain=input comment="Allow Winbox" dst-port=8763 protocol=tcp src-address-list="Ips Permitidas Admin Router"
add action=accept chain=input comment="Allow SSH" dst-port=64022 protocol=tcp src-address-list="Ips Permitidas Admin Router"
add action=accept chain=input comment="Allow API" dst-port=8728,8729 protocol=tcp src-address-list="Ips Permitidas Admin Router"
add action=accept chain=input comment="Allow SNMP" dst-port=161 protocol=udp src-address-list="Ips Permitidas Admin Router"
add action=accept chain=input comment="Allow Proxy" dst-port=8080 in-interface=all-ppp protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow RDP" dst-port=3389 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow FTP" dst-port=21 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow Syslog" dst-port=514 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow GRE" protocol=gre src-address-list=Colombia_IP
add action=accept chain=input comment="Allow PPTP" dst-port=1723 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow L2TP" dst-port=1701 protocol=udp src-address-list=Colombia_IP
add action=accept chain=input dst-port=1701 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow OVPN" dst-port=1194 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow SSTP" dst-port=443 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow BWT" dst-port=2000 protocol=udp src-address-list=Colombia_IP
add action=accept chain=input comment="Allow IPSec" protocol=ipsec-esp src-address-list=Colombia_IP
add action=accept chain=input protocol=ipsec-ah src-address-list=Colombia_IP
add action=accept chain=input dst-port=500,4500 protocol=udp src-address-list=Colombia_IP
add action=accept chain=input dst-port=9093 protocol=udp src-address-list=Colombia_IP
add action=accept chain=input dst-port=9093 protocol=tcp src-address-list=Colombia_IP
add action=accept chain=icmp comment="Allow ICMP" icmp-options=0:0 limit=5,5:packet protocol=icmp
add action=accept chain=icmp icmp-options=8:0 limit=5,5:packet protocol=icmp
add action=accept chain=icmp icmp-options=11:0 limit=5,5:packet protocol=icmp
add action=accept chain=icmp icmp-options=3:3 limit=5,5:packet protocol=icmp
add action=accept chain=icmp icmp-options=3:4 limit=5,5:packet protocol=icmp
add action=drop chain=icmp limit=5,5:packet protocol=icmp
add action=jump chain=input comment="Salto A Reglas De ICMP" jump-target=icmp protocol=icmp
add action=add-src-to-address-list address-list=ssh_blacklist address-list-timeout=1w3d chain=input comment="Dropear SSH Brute Forcers" connection-state=new dst-port=64022 protocol=tcp src-address-list=ssh_stage3
add action=add-src-to-address-list address-list=ssh_stage3 address-list-timeout=1m chain=input comment="Dropear SSH Brute Forcers" connection-state=new dst-port=64022 protocol=tcp src-address-list=ssh_stage2
add action=add-src-to-address-list address-list=ssh_stage2 address-list-timeout=1m chain=input comment="Dropear SSH Brute Forcers" connection-state=new dst-port=64022 protocol=tcp src-address-list=ssh_stage1
add action=add-src-to-address-list address-list=ssh_stage1 address-list-timeout=1m chain=input comment="Dropear SSH Brute Forcers" connection-state=new dst-port=64022 protocol=tcp
add action=drop chain=input comment="Dropear SSH Brute Forcers" dst-port=64022 protocol=tcp src-address-list=ssh_blacklist
add action=drop chain=input comment="Dropear SSH Black List" src-address-list=ssh_blacklist
add action=drop chain=input comment="Drop Proxy " dst-port=8080 protocol=tcp
add action=drop chain=input comment="Drop ICMP Ataque" protocol=icmp
add action=add-src-to-address-list address-list=Sync_Flooder address-list-timeout=30s chain=input comment="Add Sync Flood" connection-limit=30,32 protocol=tcp tcp-flags=syn
add action=drop chain=input comment="Dropear To Sync Flood" src-address-list=Sync_Flooder
add action=add-src-to-address-list address-list=Port_Scanner address-list-timeout=1d chain=input comment="Port Scanner Detect" protocol=tcp psd=21,3s,3,1
add action=drop chain=input comment="Dropear To Port Scan List" src-address-list=Port_Scanner
add action=drop chain=input comment="Ataques Scan Port" protocol=tcp psd=10,3s,3,1
add action=drop chain=input protocol=udp psd=10,3s,3,1
add action=tarpit chain=input comment="Input - Denegar Ataques DoS" connection-limit=3,32 protocol=tcp src-address-list=BlackList
add action=add-src-to-address-list address-list=BlackList address-list-timeout=1d chain=input connection-limit=10,32 protocol=tcp
add action=drop chain=input comment="Dropear Invalidos" connection-state=invalid
add action=drop chain=input comment="Dropear El Resto"
/user add name=AdminXX group=full password="PasswordDeseada"
/user disable admin 
/ip firewall address-list enable [find ]
/ip firewall filter move [find chain=forward ] destination=70
/ip firewall filter move [find chain=forward ] destination=*1
/ip firewall filter enable [find chain=forward ]
/
:global LAN [/ip address get [/ip address find comment~"Lan"]]
:global LAN [/ip address get [/ip address find comment~"LAN"]]
:global NLAN ($LAN->"network")
:global MASK /24
set $NLAN ($NLAN.$MASK)
#### LAN ####
:put $NLAN
#VERFICACION PERMITIR LAN
ip firewall address-list print where address=$NLAN
:set $LAN
:set $NLAN
:set $MASK
/
/
#### COMANDOS EXTRAS
#:global A [:toarray [/ip firewall filter find ]]
#/ip firewall filter move [find chain=forward] ($A->([len $A]-1)