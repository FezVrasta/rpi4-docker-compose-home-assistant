#!/bin/bash

sigterm()
{
  echo '"docker stop"' detected
  echo stopping now
  exit 0
}

trap 'sigterm' TERM

if [ -z "$NOIP_USERNAME" ]
then
  echo username is required
  echo use '"-e NOIP_USERNAME=your-username"' to set username
  exit 1
fi

if [ -z "$NOIP_PASSWORD" ]
then
  echo password is required
  echo use '"-e NOIP_PASSWORD=your-password"' to set password
  exit 1
fi

if [ -z "$NOIP_HOSTNAME" ]
then
  echo host name is required
  echo user '"-e NOIP_HOSTNAME=your-hostname"' to set hostname
  exit 1
fi

if [ -z "$PERIOD" ]
then
  PERIOD=30
fi

while :
do
  echo "Updating $NOIP_HOSTNAME..."
  /usr/bin/curl -s https://$NOIP_USERNAME:$NOIP_PASSWORD@dynupdate.no-ip.com/nic/update?hostname=$NOIP_HOSTNAME&myip=$(dig @resolver1.opendns.com ANY myip.opendns.com +short)
  echo "Updated!"
  sleep $PERIOD &
  wait $!
done
