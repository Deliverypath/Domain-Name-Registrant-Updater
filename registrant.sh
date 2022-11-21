#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#
# Update the registrant information for domain names in bulk. Cloudflare only.
# https://api.cloudflare.com/#registrar-domains-update-domain
#
# wget -O - https://raw.githubusercontent.com/getlynx/DomainNameRegistrant-BulkUpdater/main/registrant.sh | bash -s "first_name" "last_name" "organization" "address" "address2" "city" "state" "zip" "country" "X-Auth-Key" "X-Auth-Email" "Cloudflare Id" "domain name csv list"
# ./registrant.sh "first_name" "last_name" "organization" "address" "address2" "city" "state" "zip" "country" "X-Auth-Key" "X-Auth-Email" "Cloudflare Id" "domain name csv list"

domains="${13}"
h1="X-Auth-Email: ${11}"
h2="X-Auth-Key: ${10}"
h3="Content-Type: application/json"
data="{\"registrant\":{\"first_name\":\"$1\",\"last_name\":\"$2\",\"organization\":\"$3\",\"address\":\"$4\",\"address2\":\"$5\",\"city\":\"$6\",\"state\":\"$7\",\"zip\":\"$8\",\"country\":\"$9\",\"privacy\":true,\"locked\":true,\"auto_renew\":true}}"

for val in ${domains//,/ }
do
     curl -X PUT "https://api.cloudflare.com/client/v4/accounts/${12}/registrar/domains/$val/contacts" -H "$h1" -H "$h2" -H "$h3" -d "$data"

     echo "Updated: $val"

     sleep 15
done
