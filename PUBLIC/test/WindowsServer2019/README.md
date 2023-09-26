# Configuraciones dentro el sistema
+ Apache9
+ Soaviert
+ New-LocalUser -Name gmarinan -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd123" -Force)
+ net localgroup "RDP" /add
+ Add-LocalGroupMember -Group "RDP" -Member gmarinan
+ Enable-NetFirewallRule -DisplayGroup "RDP"
