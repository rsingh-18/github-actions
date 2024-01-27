# Overview

This guide will brief you on how to <u>run</u> `GitHub actions` using `environments` for various `workflows`.

# Install / Remove pre_deployment_addons

## Create Environment
Go to `Repository` 👉 `Settings` 👉 `Environments`
> ➡️ Name the environment wrt the `namespace` for better understanding

## Configuring Environment
<details>
    <summary>Click to view</summary>
    
    
    1. ✔️ 🔒  - required inputs
    2. 🍒 🔓  - inputs to override defaults
</details>

#### Variables / Secrets to add
<table>
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
        <th>Additional details</th>
    </tr>
    <tr>
        <th>✔️ 🔒 AWS_ACCESS_KEY_ID</th>
        <th rowspan=3>secret</th>
        <td>Access key of an AWS IAM user with S3 backend configuration access</td>
        <td rowspan=2><a href="https://github.com/philips-internal/HSP_PS_IAMDEVOPS/blob/fr_721_fiesta/TFSTATEVERSIONING.md#secret_key" target="_blank">Fetching creds</a></td>
    </tr>
    <tr>
        <th>✔️ 🔒  AWS_SECRET_ACCESS_KEY</th>
        <td>Secret Access key of an AWS IAM user with S3 backend configuration access</td>
    </tr>
    <tr>
        <th>✔️ 🔒  EKS_CLUSTER_NAME</th>
        <td>Name of the EKS cluster</td>
        <td>aws eks list-cluster</td>
    </tr>
    <tr>
        <th>✔️ 🔒  ADMIN_USER_POLICYARN</th>
        <th rowspan=27>variable</th>
        <td rowspan=27><a href="https://github.com/philips-internal/HSP_PS_IAMDEVOPS/tree/fr_721_fiesta/fiesta_addons/pre_deployment_addons#variables--input-parameters-description" target="_blank">Click Here to view parameter description</a></td>
        <td rowspan=2><a href="https://github.com/philips-internal/HSP_PS_IAMDEVOPS/blob/fr_721_fiesta/fiesta_addons/pre_deployment_addons/terraform.tfvars.example" target="_blank">terraform.tfvars.example</a></td>
    </tr>
    <tr>
        <th>✔️ 🔒  S3POLICYARN</th>
    </tr>
    <tr>
        <th>✔️ 🔒  AWS_ACCOUNT_ID</th>
        <td>aws sts get-caller-identity | jq .Account</td>
    </tr>
    <tr>
        <th>✔️ 🔒  ENABLE_BUCKET_CREATION</th>
        <td rowspan=4><a href="https://github.com/philips-internal/HSP_PS_IAMDEVOPS/tree/fr_721_fiesta/fiesta_addons/pre_deployment_addons#resources--modules-overview" target="_blank">Module flags</a></td>
    </tr>
    <tr>
        <th>✔️ 🔒  ENABLE_IAM_RESOURCE_CREATION</th>
    </tr>
    <tr>
        <th>✔️ 🔒  ENABLE_NAMESPACE_CREATION</th>
    </tr>
    <tr>
        <th>✔️ 🔒  ENABLE_RDS_CREATION</th>
    </tr>
    <tr>
        <th>✔️ 🔒  NAMESPACE</th>
        <td>e.g., iam-dev</td>
    </tr>
    <tr>
        <th>✔️ 🔒  RDS_CA_CERTIFICATE_IDENTIFIER</th>
        <td rowspan=19>--</td>
    </tr>
    <tr>
        <th>🍒 🔓  OBJECTS_EXPIRATION_DAYS</th>
    </tr>
    <tr>
        <th>🍒 🔓  ALLOCATED_STORAGE</th>
    </tr>
    <tr>
        <th>🍒 🔓  ALLOW_MAJOR_VERSION_UPGRADE</th>
    </tr>
    <tr>
        <th>🍒 🔓  APPLY_IMMEDIATELY</th>
    </tr>
    <tr>
        <th>🍒 🔓  AUTO_GENERATE_PASSWORD</th>
    </tr>
    <tr>
        <th>🍒 🔓  AUTO_MINOR_VERSION_UPGRADE</th>
    </tr>
    <tr>
        <th>🍒 🔓  MAX_ALLOCATED_STORAGE</th>
    </tr>
    <tr>
        <th>🍒 🔓  BACKUP_RETENTION_PERIOD</th>
    </tr>
    <tr>
        <th>🍒 🔓  COPY_TAGS_TO_SNAPSHOT</th>
    </tr>
    <tr>
        <th>🍒 🔓  MULTIAZ</th>
    </tr>
    <tr>
        <th>🍒 🔓  DB_INSTANCE_CLASS</th>
    </tr>
    <tr>
        <th>🍒 🔓  ENGINE</th>
    </tr>
    <tr>
        <th>🍒 🔓  ENGINE_VERSION</th>
    </tr>
    <tr>
        <th>🍒 🔓  PORT</th>
    </tr>
    <tr>
        <th>🍒 🔓  PUBLICLY_ACCESSIBLE</th>
    </tr>
    <tr>
        <th>🍒 🔓  SKIP_FINAL_SNAPSHOT</th>
    </tr>
    <tr>
        <th>🍒 🔓  STORAGE_ENCRYPTED</th>
    </tr>
    <tr>
        <th>🍒 🔓  STORAGE_TYPE</th>
    </tr>
</table>

## Running Workflows
1. Go to `Repository` 👉 `Actions`
2. Select workflow 💡
    - `Predeployment Addons`
    - `Delete Predeployment Addons`
3. Click on `Run workflow` 👉 Type the `environment` name 👉 `Run Workflow`