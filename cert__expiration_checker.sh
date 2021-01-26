#!/bin/bash

expirationdate=$(date -d "$(: | openssl s_client -connect $1:443 -servername $1 2>/dev/null \
                              | openssl x509 -text \
                              | grep 'Not After' \
                              |awk '{print $4,$5,$7}')" '+%s');

echo "The certificate from $1 expires at: $(date -d @$expirationdate '+%d-%m-%Y')"
