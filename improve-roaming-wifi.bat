for /f "tokens=4*" %a in ('netsh wlan show profiles ^| findstr /c:"All User Profile"') do netsh wlan set profileparameter name="%b" connectionmode=auto

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "RoamingAggressiveness" /t REG_SZ /d "5" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "RoamingSensitivity" /t REG_SZ /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "RoamTrigger" /t REG_SZ /d "-70" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "RoamDelta" /t REG_SZ /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "RoamingPreferBand" /t REG_SZ /d "2" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RoamingAggressiveness" /t REG_SZ /d "5" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0001" /v "RoamingSensitivity" /t REG_SZ /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v ArpRetryCount /t REG_DWORD /d 0 /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fMinimizeConnections" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fBlockNonDomain" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\19112234-5050-4870-8a37-522568651142\1230441a-0000-0000-0000-000000000000" /v "Attributes" /t REG_DWORD /d "2" /f

powercfg /SETACVALUEINDEX SCHEME_CURRENT 19112234-5050-4870-8a37-522568651142 1230441a-0000-0000-0000-000000000000 0

powercfg /SETDCVALUEINDEX SCHEME_CURRENT 19112234-5050-4870-8a37-522568651142 1230441a-0000-0000-0000-000000000000 0

netsh wlan set autoconfig enabled=yes interface="*"

netsh interface set interface name="Wi-Fi" admin=disabled

netsh interface set interface name="Wi-Fi" admin=enabled

netsh int ip reset >nul

arp -d * >nul

ipconfig /flushdns >nul

netsh wlan show wlanreport

echo All complete, Reboot now!

PAUSE

