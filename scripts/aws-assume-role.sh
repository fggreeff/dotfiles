#! /bin/bash

# IMPORTANT - this must be sourced rather than executed i.e.
# Switch roles usage:
# . aws-assume-role role_arn
# or pick an env such as "test" or "prod"
# . aws-assume-role environment
# or to roll back to MAIN aws account:
# . aws-assume-role
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

if [ $# -ne 1 ] || [ "$1" == "" ]; then
    echo "Rolling back to default role"
else
    AWS_ROLE=$1
    [ "$AWS_ROLE" == "prod" ] && AWS_ROLE="arn:aws:iam::<REPLACE_WITH_ACC_ID>:role/<REPLACE_WITH_ROLE>"
    [ "$AWS_ROLE" == "nonprod" ] && AWS_ROLE="arn:aws:iam::<REPLACE_WITH_ACC_ID>:role/<REPLACE_WITH_ROLE>"
    [ "$AWS_ROLE" == "dev" ] && AWS_ROLE="arn:aws:iam::<REPLACE_WITH_ACC_ID>:role/<REPLACE_WITH_ROLE>"

    echo "Assuming AWS IAM role: $AWS_ROLE"
    CREDENTIALS=$(aws sts assume-role --role-arn "$AWS_ROLE" --role-session-name $(hostname) | jq .Credentials)
    echo "CREDENTIALS= $CREDENTIALS"
    export AWS_ACCESS_KEY_ID=$(echo "$CREDENTIALS" | jq -r .AccessKeyId)
    export AWS_SECRET_ACCESS_KEY=$(echo "$CREDENTIALS" | jq -r .SecretAccessKey)
    export AWS_SESSION_TOKEN=$(echo "$CREDENTIALS" | jq -r .SessionToken)
fi
