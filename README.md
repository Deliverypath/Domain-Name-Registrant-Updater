# Domain Name Registrant Bulk Updater for the Cloudflare API

The shell script can be called remotely via CLI with the following syntax. Just fill in the required fields.

### Syntax

```
wget -O - https://raw.githubusercontent.com/getlynx/DomainNameRegistrant-BulkUpdater/main/registrant.sh \
| bash -s "first_name" "last_name" "organization" "address" "address2" "city" "state" "zip" "country" \
"X-Auth-Key" "X-Auth-Email" "Cloudflare Id" \
"domain name csv list"
```

### Sample

```
wget -O - https://raw.githubusercontent.com/getlynx/DomainNameRegistrant-BulkUpdater/main/registrant.sh \
| bash -s "John" "Doe" "NewCo, LLC" "123 Elm Street" "" "Ilion" "NY" "13357" "US" \
"87287697ab93ac22f6e2f32b16abcd123450b" "john@newco.com" "987a66ee23456f15fbf6607ebe65432c" \
"newco.com,newco.net,newco.org,newco.co,newco.io,newco.biz"
```

### Notes

The script includes a 15 sec pause after each domain name update. This is to make it easy on the Cloudflare API and to give you time to visit your email and approve the changes, while the script is running. You will get a verification email for each change request submitted. The email is sent to the (previous) email on file with each respective domain. 

If the change are submitting matches the the information on file, no change will occur and no verification email will be received - essentially the change request is ignored.

Details about the Cloudflare API can be found [here](https://api.cloudflare.com/#registrar-domains-update-domain).

This script does not include the following fields; phone, email, fax.
