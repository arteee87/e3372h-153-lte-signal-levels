#!/bin/sh

DATA=`curl http://192.168.8.1/api/webserver/SesTokInfo`
SESSION_ID=`echo "$DATA" | grep "SessionID=" | cut -b 10-147`
TOKEN=`echo "$DATA" | grep "TokInfo" | cut -b 10-41`
REQUEST=`curl http://192.168.8.1/api/device/signal -H "Cookie: $SESSION_ID" -H "__RequestVerificationToken: $TOKEN"`
RSRQ=`echo "$REQUEST" | perl -nle'print $& while m{(?<=<rsrq>).*(?=dB)}g'`
RSRP=`echo "$REQUEST" | perl -nle'print $& while m{(?<=<rsrp>).*(?=dB)}g'`
RSSI=`echo "$REQUEST" | perl -nle'print $& while m{(?<=<rssi>).*(?=dB)}g'`
SINR=`echo "$REQUEST" | perl -nle'print $& while m{(?<=<sinr>).*(?=dB)}g'`

echo "<prtg>
<result>
<channel>RSRQ</channel>
<value>"$RSRQ"</value>
<unit>custom</unit>
<customunit>dB</customunit>
</result>
<result>
<channel>RSRP</channel>
<value>"$RSRP"</value>
<unit>custom</unit>
<customunit>dBm</customunit>
</result>
<result>
<channel>RSSI</channel>
<value>"$RSSI"</value>
<unit>custom</unit>
<customunit>dBm</customunit>
</result>
<result>
<channel>SINR</channel>
<value>"$SINR"</value>
<unit>custom</unit>
<customunit>dB</customunit>
</result>
</prtg>"
