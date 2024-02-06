resource "kubectl_manifest" "engiam_aws_admin_group" {
  provider = kubectl

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: Group
  metadata:
    name: ${local.namespace}-admin-group
  spec:
    forProvider:
      path: /users/
  YAML
}

resource "kubectl_manifest" "engiam_aws_admin_group_policy_attachment" {
  provider = kubectl

  sensitive_fields = [
    "spec.forProvider.policyArn"
  ]

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: GroupPolicyAttachment
  metadata:
    name: ${local.namespace}-admin-group-policy-attachment
  spec:
    forProvider:
      policyArn: ${local.admin_user_policyArn}
      group: ${local.namespace}-admin-group
  YAML
}

resource "kubectl_manifest" "engiam_aws_attach_admin_user_to_group" {
  provider = kubectl

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: UserGroupMembership
  metadata:
   name: ${local.namespace}-admin-user-group-membership
  spec:
    forProvider:
      user: ${local.namespace}-admin-user
      groups: 
        - ${local.namespace}-admin-group
  YAML
}