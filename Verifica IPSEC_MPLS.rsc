{
   :local PrimaryPolicy 1
   :local SecondaryPolicy 2
   :local PrimaryPeer 0

   :local PrimaryOK [:ping 143.0.95.225 src-address=192.168.205.2 count=3];
   :local SecondaryOK [:ping 143.0.95.226 src-address=190.85.107.246 count=3];
   :local GWPrimaryOK [:ping 192.168.205.1 count=3];
   :local PrimaryUP ($PrimaryOK + $GWPrimaryOK);
   :local PrimaryActive [/ip ipsec policy get number=$PrimaryPolicy disable];

   :log info "Status: $PrimaryUP $SecondaryOK $PrimaryActive";
   # Test case: set $PrimaryOK 0;

   :if ($PrimaryUP < 4 && $SecondaryOK > 1 && $PrimaryActive) do={
         /ip ipsec peer enable numbers=0;
         /ip ipsec policy enable [/ip ipsec policy find where peer=peer1];
         /ip firewall nat enable [/ip firewall nat find where action=accept];
         /ip firewall connection remove [find ]
         :log warn "Ipsec and Nat Up";
   } 

  :if ($PrimaryOK = 3 && $GWPrimaryOK = 3 && !$PrimaryActive) do={
         /ip ipsec peer disable numbers=0;
         /ip ipsec policy disable [/ip ipsec policy find where peer=peer1];
         /ip firewall nat disable [/ip firewall nat find where action=accept];
         /ip firewall connection remove [find ]
         :log warn "Ipsec and Nat Down";
   }
}