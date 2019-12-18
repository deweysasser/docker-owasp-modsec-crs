#!/usr/bin/env bash

set -v -x


# Decide on enforcing vs DetectionOnly (or even OFF) mode via optional environment variable
ENFORCING=${ENFORCING:-On}
CONF=/etc/modsecurity.d/modsecurity.conf

if [ -f /etc/apache2/modsecurity.d/modsecurity.conf ] ; then
  CONF=/etc/apache2/modsecurity.d/modsecurity.conf
fi

sed -i -e "s/SecRuleEngine.*/SecRuleEngine ${ENFORCING}/g" $CONF

exec  /docker-entrypoint.sh "$@"


