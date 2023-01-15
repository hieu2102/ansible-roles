#!/bin/bash

NEW_LISTENER="${1}"
sed -i -r "s|^(listeners=.+)|\1,${NEW_LISTENER}|g" /etc/kafka/server.properties