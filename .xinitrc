if [ -f ~/.Xmodmap ]
then
  xmodmap ~/.Xmodmap
fi

exec dbus-launch openbox-session
