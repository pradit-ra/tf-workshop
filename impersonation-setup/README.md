# Data platform team Terraform tutorial

We are in `group:gcp-data-lead@tdshop.io`

## Set Terraform service account impersonation

### Create SA 

```bash
export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"` 
gcloud iam service-accounts create terraform \
    --description="Terraform Service Account" \
    --display-name="terraform"
```

** Grant roles ** 

- `roles/storage.admin`
- `roles/iam.serviceAccountUser`
- `roles/iam.serviceAccountTokenCreator`
- `roles/compute.networkAdmin`
- `roles/compute.securityAdmin`
- `roles/compute.admin`

```bash
export GOOGLE_SERVICE_ACCOUNT=`gcloud iam service-accounts list --format="value(email)" \
 --filter=description:"Terraform Service Account"` 

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
--role="roles/storage.admin"

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
--role="roles/compute.admin"

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
--role="roles/iam.securityAdmin"

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
--role="roles/iam.serviceAccountTokenCreator"

gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member="serviceAccount:$GOOGLE_SERVICE_ACCOUNT" \
--role="roles/iam.serviceAccountUser"

```

### Bind user account to SA and allow create account token

```bash
export USER_ACCOUNT_ID=`gcloud config get core/account`
export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=$GOOGLE_SERVICE_ACCOUNT

gcloud iam service-accounts set-iam-policy $GOOGLE_IMPERSONATE_SERVICE_ACCOUNT policy.json

# list service account policy
gcloud iam service-accounts get-iam-policy $GOOGLE_IMPERSONATE_SERVICE_ACCOUNT > policy.json
```

### Test print access token

```bash
gcloud auth print-access-token --impersonate-service-account=$GOOGLE_IMPERSONATE_SERVICE_ACCOUNT
```
