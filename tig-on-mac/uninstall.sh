brew uninstall influxdb-cli
brew uninstall influxdb
brew uninstall telegraf
brew uninstall grafana

rm -rf /opt/homebrew/etc/influxdb2
rm -rf /opt/homebrew/etc/telegraf.conf
rm -rf /opt/homebrew/etc/telegraf.d
rm -rf /opt/homebrew/etc/grafana

rm -rf ~/.influxdbv2
