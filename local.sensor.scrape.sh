# zerodp05.local
# front bedroom ESP Easy Mega: FrontBed_4
timeout 60 /usr/bin/curl -s  http://192.168.111.133/metrics |grep front.Temperature |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k front.Temperature -o
timeout 60 /usr/bin/curl -s  http://192.168.111.133/metrics |grep front.Humidity |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k front.Humidity -o

# basement ESP Easy Mega: basement_5
timeout 60 /usr/bin/curl -s  http://192.168.111.214/metrics |grep base.Temperature |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k base.Temperature -o
timeout 60 /usr/bin/curl -s  http://192.168.111.214/metrics |grep base.Pressure |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k base.Pressure -o

# dining room ESP Easy Mega: dining_10
timeout 60 /usr/bin/curl -s  http://192.168.111.35/metrics |grep dining.Temperature |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k dining.Temperature -o
timeout 60 /usr/bin/curl -s  http://192.168.111.35/metrics |grep dining.Pressure |awk -F " " '{print $2}' | xargs /usr/bin/zabbix_sender -z zab6 -p 10051 -s Receiver01 -k dining.Pressure -o
