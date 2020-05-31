# e3372h-153-lte-signal-levels
Scripts to retrieve LTE signal levels with PRTG Network monitor (SSH Custom Script)

Requirements:
1) USB modem to be accessible at 192.168.8.1
2) Entware-3x installed
3) opkg install curl
4) opkg install dropbear (to enable ssh access)

Installation:

1) place S60prtgsignal.sh to /online/opt/etc/init.d/
2) make it executable and readable via chmod
3) place signal.sh to /online/opt/etc/
4) reboot the modem
5) add SSH custom script sensor at your prtg server/probe, choose "signal.sh"


If everything worked, you should now recieve 4 channels: rsrq, rsrp, rssi and sinr with a correct unit each. 

Tested on FW 22.329.07.00.00, WEB 22.329.07.00.00-MOD1.21 (4pda)
