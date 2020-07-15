# pitemp-exporter
Pyton based Raspberry Pi Temperature to prometheus exporter.


Run via docker with:

docker run --privileged -v /sys/class/thermal/thermal_zone0/temp:/sys/class/thermal/thermal_zone0/temp -p 9547:9547 ksanislo/pitemp-exporter
