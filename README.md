# Domain Name Registrant Bulk Updater for the Cloudflare API

The script can be called remotely via CLI with the following syntax. Just fill in the required fields.

```
wget -O - registrant.sh | bash -s "f_name" "l_name" "org" "address" "address2" "city" "state" "zip" "country" "X-Auth-Key" "X-Auth-Email" "Cloudflare Id" "domain name csv list"
```

The script includes a 15 sec pause after each domain name update. This is to make it easy on the Cloudflare API and. to give you time to visit your email and approve the changes. You will get a verification email for each change request submitted. The email is sent to the (previous) email on file with each respective domain.
