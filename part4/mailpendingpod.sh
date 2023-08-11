#!/bin/bash

TO_EMAIL="tejani317@gmail.com"
SUBJECT="Pending Pods Found!"

PENDING_PODS=$(kubectl get pods --field-selector=status.phase=Pending -o json | jq -r '.items[].metadata.name')
TIMESTAMP=$(date +"data -> %Y-%m-%d  time -> %H-%M-%S")

if [ -n "$PENDING_PODS" ] && [ -n "$TIMESTAMP" ]; then
    EMAIL_CONTENT="$PENDING_PODS - $TIMESTAMP"
    echo -e "To: $TO_EMAIL\nSubject: $SUBJECT\n\n$EMAIL_CONTENT" | ssmtp tejani317@gmail.com
    echo "Email Sent!"
else
    echo "No pending pods found or timestamp is empty."
fi
