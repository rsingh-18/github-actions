resource "kubectl_manifest" "engiam_aws_admin_user" {
  provider = kubectl

  sensitive_fields = [
    "spec.forProvider.permissionsBoundary"
  ]

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: User
  metadata:
    name: ${local.namespace}-admin-user
  spec:
    forProvider:
      permissionsBoundary: ${local.admin_user_policyArn}
  YAML
}

resource "kubectl_manifest" "engiam_aws_admin_user_access_key" {
  provider = kubectl

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: AccessKey
  metadata:
    name: ${local.namespace}-admin-user-access-key
  spec:
    forProvider:
      status: Active
      user: ${local.namespace}-admin-user
    writeConnectionSecretToRef:
      name: ${local.namespace}-admin-user-access-key
      namespace: ${local.namespace}
  YAML
}