data "aws_caller_identity" "this" {}

resource "aws_kms_key" "this" {
    description = "For encrypting and decrypting db_password parameter"
    deletion_window_in_days = 7

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
    "Sid": "Allow access for Account Holder",
    "Effect": "Allow",
    "Principal": {
        "AWS": "${data.aws_caller_identity.this.arn}"
    },
    "Action": [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion",
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*"
    ],
    "Resource": "*"
    },
    {
      "Sid": "Allow use of the key",
      "Effect": "Allow",
      "Principal": {"AWS": [
        "${var.ec2_aws_iam_role_arn}"
      ]},
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}