#!/bin/bash

CONFIG_FILE="${1:?}"

ATTRIBUTE_TO_UPDATE="${2:?}"

APPEND_VALUE="${3:?}"

# check if append_value already exists


if ! grep -E "^${ATTRIBUTE_TO_UPDATE}=.*${APPEND_VALUE}.*" "${CONFIG_FILE}";then
sed -i -r "s|^(${ATTRIBUTE_TO_UPDATE}=.+)|\1,${APPEND_VALUE}|g" "${CONFIG_FILE}"
fi