#! /bin/sh

eval `dbus export softether`

# stop first
if [ "$softether_enable" == "1" ];then
	/koolshare/softether/softether.sh stop
fi
# copy new files
cd /tmp


cp -rf /tmp/softether/softether /koolshare/
cp -rf /tmp/softether/scripts/* /koolshare/scripts/
cp -rf /tmp/softether/webs/* /koolshare/webs/
cp -rf /tmp/softether/res/* /koolshare/res/


rm -rf /tmp/koolproxy* >/dev/null 2>&1

chmod 755 /koolshare/softether/*
chmod 755 /koolshare/scripts/*

sleep 1
if [ "$softether_enable" == "1" ];then
	/koolshare/softether/softether.sh start
fi

