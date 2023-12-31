#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

cd Release

java -cp ".:./jars/*" Application $(bashio::config 'mqtt_broker_ip') $(bashio::config 'mqtt_username') $(bashio::config 'mqtt_password') $(bashio::config 'pin') $(bashio::config 'panel_id') $(bashio::config 'panel_ip_address')