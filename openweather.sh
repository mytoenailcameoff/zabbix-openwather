#openweather free plan  60 calls/minute  1,000,000 calls/month
#curl pollution 
curl "https://api.openweathermap.org/data/2.5/air_pollution?lat=39.9227&lon=-75.1812&appid=1b8a96ecc82499da04a527c13fe0c492" > /tmp/openweather.api

#pm2.5
sed 's/,/\n/g' /tmp/openweather.api |grep pm2_5 | awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.pm25 -o

#co
sed 's/,/\n/g' /tmp/openweather.api |grep \"co\"  | awk -F ":" '{print $3}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.co -o

#no
sed 's/,/\n/g' /tmp/openweather.api |grep \"no\"  |awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.no -o

#no2
sed 's/,/\n/g' /tmp/openweather.api |grep no2 | awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.no2 -o

#so2
sed 's/,/\n/g' /tmp/openweather.api |grep so2 | awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.so2 -o

#o3
sed 's/,/\n/g' /tmp/openweather.api |grep o3 | awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.o3 -o

#nh3
sed 's/,/\n/g' /tmp/openweather.api |grep nh3 | awk -F ":" '{print $2}' | awk -F "}" '{print $1}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k openweather.api.nh3 -o

#AQI
/usr/local/bin/air show |grep philly |awk -F "│" '{print $3}' | xargs /usr/bin/zabbix_sender -z 127.0.0.01 -p 10051 -s Receiver01 -k aqi.rit -o

#curl current weather
curl "https://api.openweathermap.org/data/2.5/weather?lat=39.9227&lon=-75.1812&appid=1b8a96ecc82499da04a527c13fe0c492" > /tmp/openweather.current.api

#current temp
sed 's/,/\n/g' /tmp/openweather.current.api |grep temp |head -n 1 | awk -F ":" '{print $3}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k  openweather.api.current.temp -o

#current temp feels like
sed 's/,/\n/g' /tmp/openweather.current.api |grep feels_like | awk -F ":" '{print $2}' | xargs /usr/bin/zabbix_sender -v -z 127.0.0.1 -p 10051 -s Receiver01 -k  openweather.api.current.feels_like.temp -o 
