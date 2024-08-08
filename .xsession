. "/home/thomas/.profile"

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
        eval `dbus-launch --sh-syntax --exit-with-x11`
fi

xrdb ~/.Xresources
xcompmgr &

exec cwm
