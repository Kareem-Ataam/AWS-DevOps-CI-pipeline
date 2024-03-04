#!/bin/bash
ALL_RESOURCES=$(terraform state list)
RESOURCE_TO_KEEP="module.backup-srv.aws_s3_bucket.mybucket"
for RESOURCE in $ALL_RESOURCES; do
  if [[ "$RESOURCE" != "$RESOURCE_TO_KEEP" ]]; then
    terraform destroy -auto-approve -target="$RESOURCE"
  fi
done