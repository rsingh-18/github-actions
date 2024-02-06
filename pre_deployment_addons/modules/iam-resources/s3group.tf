resource "kubectl_manifest" "engiam_aws_s3_group" {
  provider = kubectl

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: Group
  metadata:
    name: ${local.namespace}-s3-group
  spec:
    forProvider:
      path: /users/
  YAML
}

resource "kubectl_manifest" "engiam_aws_s3_group_policy_attachment" {
  provider = kubectl

  sensitive_fields = [
    "spec.forProvider.policyArn"
  ]

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: GroupPolicyAttachment
  metadata:
    name: ${local.namespace}-s3-group-policy-attachment
  spec:
    forProvider:
      policyArn: ${local.s3policyArn}
      group: ${local.namespace}-s3-group
  YAML
}

resource "kubectl_manifest" "engiam_aws_attach_s3_user_to_group" {
  provider = kubectl

  yaml_body = <<-YAML
  apiVersion: iam.aws.upbound.io/v1beta1
  kind: UserGroupMembership
  metadata:
   name: ${local.namespace}-s3-user-group-membership
  spec:
    forProvider:
      user: ${local.namespace}-s3-user
      groups: 
        - ${local.namespace}-s3-group
  YAML
}