#!/bin/sh

while true; do
	IWX0="$(ifconfig iwx0)"
	IP_ADDR="$(echo "$IWX0" | grep inet | cut -d ' ' -f 2)" 
	SSID="$(echo "$IWX0" | grep ieee80211 | cut -d ' ' -f 3)" 
	WIFI_INFO="Wi-Fi: ${SSID}, $IP_ADDR"

	BAT_PERCENT="$(apm -l)%"
	BATTERY_INFO="Battery: $BAT_PERCENT"
	# Only report minutes remaining if battery is discharging
	if [ "$(apm -a)" -eq 0 ]; then
		BAT_LIFETIME="$(apm -m)"
		BATTERY_INFO="$BATTERY_INFO, $BAT_LIFETIME minutes remaining"
	fi

	DATETIME="$(date +"%v %R")"
	VOL_DECIMAL="$(sndioctl -n output.level)"
	# Convert decimal to percent, truncate the decimal point
	VOL_PERCENT="$(dc -e "$VOL_DECIMAL 100*0k1/p")"
	VOLUME="Volume: ${VOL_PERCENT}%"
	if [ "$(sndioctl -n output.mute)" -eq 1 ]; then
		VOLUME="$VOLUME (muted)"
	fi
	RIGHT_STATUS="$VOLUME    $DATETIME"

	echo "%{l} $WIFI_INFO %{c} $BATTERY_INFO %{r} $RIGHT_STATUS"
	sleep 30
done |
	lemonbar -p -d \
		-B "#282828" \
		-F "#ebdbb2" \
		-f "-misc-spleen-medium-r-normal--16-160-72-72-c-80-iso10646-1"


