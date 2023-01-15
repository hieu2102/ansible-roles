#!/bin/bash

NEW_MAP="${1}"

sed -i -r "s|^(listener.security.protocol.map=.+)|\1,${NEW_MAP}|g" /etc/kafka/server.properties