. "/home/thomas/.profile"

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
        eval `dbus-launch --sh-syntax --exit-with-x11`
fi

xrdb ~/.Xresources
redshift -l 33.95:-83.38 &
xcompmgr &
~/.local/bin/lemonbar.sh &
hsetroot -solid "rgb:28/28/28" &
xidle -ne -delay 5 -timeout 300 &

exec cwm
