#!/bin/bash

NEW_MECHANISM="${1}"

sed -i -r  "s|^(sasl.enabled.mechanisms=.+)|\1,${NEW_MECHANISM}|g" /etc/kafka/server.properties