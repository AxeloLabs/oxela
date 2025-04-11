firebase dataconnect:sdk:generate
firebase dataconnect:deploy

echo "Firebase project: $(jq -r '.projects.default' .firebaserc)" && echo "GCloud project: $(gcloud config get-value project)"

alias check-projects='echo "Firebase: $(jq -r ".projects.default" .firebaserc) | GCloud: $(gcloud config get-value project)"'

firebase use
firebase projects:list
gcloud config get-value project
gcloud projects describe oxela-dataconnect

# id backedn (app hosting)

firebase apphosting:backends:list --project oxela-dataconnect

# grant access to secret env

firebase apphosting:secrets:grantaccess FIREBASE_API_KEY --project oxela-dataconnect --backend oxela-backend-id

# ID numero de projet gcloud

gcloud projects describe oxela-dataconnect --format="value(projectNumber)"
<!-- 268533009789 -->
gcloud projects describe oxela-dataconnect

firebase apphosting:secrets:list

gcloud secrets list

API [secretmanager.googleapis.com] not
enabled on project [id-jungletour-2025].
Would you like to enable and retry (this will
 take a few minutes)? (y/N)?  

 gcloud secrets list
gcloud config get-value project
gcloud config set project oxela-dataconnect
gcloud auth application-default set-quota-project oxela-dataconnect

# Axel

# Users/ax/0-HOME/0--IT--mac2025/

# VS/poc/oxela/

lsof -i -P | grep LISTEN

# allow app hosting to use secrets

firebase apphosting:secrets:grantaccess FIREBASE_API_KEY,FIREBASE_AUTH_DOMAIN, FIREBASE_PROJECT_ID,FIREBASE_STORAGE_BUCKET,FIREBASE_MESSAGING_SENDER_ID, FIREBASE_APP_ID,GOOGLE_API_KEY,STRIPE_ACCOUNT_ID,STRIPE_SECRET_KEY,STRIPE_PUB_KEY,STRIPE_WEBHOOK_SECRET --project oxela-dataconnect --backend oxela-backend-id

firebase apphosting:secrets:grantaccess FIREBASE_APP_ID,GOOGLE_API_KEY,STRIPE_ACCOUNT_ID,STRIPE_SECRET_KEY,STRIPE_PUB_KEY,STRIPE_WEBHOOK_SECRET  --project oxela-dataconnect --backend oxela-backend-id

projects/268533009789/secrets/FIREBASE_API_KEY
projects/268533009789/secrets/STRIPE_ACCOUNT_ID
