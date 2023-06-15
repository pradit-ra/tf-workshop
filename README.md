# Data platform team Terraform tutorial

## Prerequitsite

Install Terraform

```bash
brew install tfenv && \
    tfenv install 1.4.6 && \
    tfenv use 1.4.6
```

### Login to GCP tdshop-data-internal

```bash
gcloud config set project tdshop-data-internal
gcloud auth application-default login
```

## Tutorials
- branch: feature/AI-1057-terraform-basic-network
    - create infra
    - change infra
    - destroy infra
    - input/output

- branch: feature/AI-1057-module

- branch: feature/AI-1057-module-complex-vars

- branch: feature/AI-1057-gcs-backend-stage

## Useful resources

- https://developer.hashicorp.com/terraform/tutorials
