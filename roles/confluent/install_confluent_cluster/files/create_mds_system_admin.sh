#!/bin/bash

ZOOKEEPER_URL="${1}"
CONFLUENT_PLATFORM_USERNAME="${2}"
CONFLUENT_PLATFORM_PASSWORD="${3}"
CONFLUENT_PLATFORM_MDS_URL="${4}"
export CONFLUENT_PLATFORM_MDS_URL CONFLUENT_PLATFORM_PASSWORD CONFLUENT_PLATFORM_USERNAME

CLUSTER_ID="$(zookeeper-shell "${ZOOKEEPER_URL}" get /cluster/id 2>/dev/null|grep id|sed 's|:| |g' |awk '{print $NF}' | sed -E 's|"(.+)"}|\1|g')"
confluent login
confluent iam rbac role-binding create --principal User:"${CONFLUENT_PLATFORM_USERNAME}" --role SystemAdmin --kafka-cluster-id "${CLUSTER_ID}"
