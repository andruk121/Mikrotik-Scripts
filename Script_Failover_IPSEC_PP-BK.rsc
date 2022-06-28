{
    #Configurar Email - Failover de IPSEC principal & Backup
    /tool e-mail
    set address=173.194.77.108 from=correo_SRC@gmail.com password=p4a$$w0rd port=587 start-tls=yes user=correo_SRC
   
   #Variables
   :global data [/system clock get date]
   :global hora [/system clock get time]
   :global identity [/system identity get name]
   :local PrimaryPolicy 2
   :local SecondaryPolicy 3
   :local PrimaryPeer 0
   :local SecondaryPeer 2 
   
   :local PrimaryOK [/ip ipsec active-peer print count-only where ph2-total];
   :local SecondaryOK [/ip ipsec active-peer print count-only where ph2-total];
   :local PrimaryActive [/ip ipsec policy get $PrimaryPolicy active];
 
   :log info "Status: $PrimaryOK $SecondaryOK $PrimaryActive";
   # Test case: set $PrimaryOK 0;

   :if ($PrimaryOK < 1 && $PrimaryActive=false) do={
         :log warn "switch to failover";
         /ip ipsec policy disable $PrimaryPolicy;
         /ip ipsec policy enable $SecondaryPolicy;
         /ip ipsec peer disable $PrimaryPeer;
         /ip ipsec peer enable $SecondaryPeer;
         /tool e-mail send from="correo_SRC@gmail.com" to="correo_DST@gmail.com" cc="correo_DST_cc@gmail.com,otro_correo@gmail.com" subject="IPSec Caída $identity $data a las $hora" body="La Ipsec Principal en la sede $identity se ha caído, por favor verificar la IPSec y con el área TI de Miniso"
   }
   }
