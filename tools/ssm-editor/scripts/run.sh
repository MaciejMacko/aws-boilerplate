#!/bin/bash

set -e

FULL_SERVICE_NAME="env-${PROJECT_ENV_NAME}-${CHAMBER_SERVICE}";
CHAMBER_KMS_KEY_ALIAS="${PROJECT_ENV_NAME}-main"

CHAMBER_KMS_KEY_ALIAS="${CHAMBER_KMS_KEY_ALIAS}" /bin/chamber export "${FULL_SERVICE_NAME}" \
  | jq '.' \
  | vipe \
  | CHAMBER_KMS_KEY_ALIAS="${CHAMBER_KMS_KEY_ALIAS}" /bin/chamber import "${FULL_SERVICE_NAME}" -
