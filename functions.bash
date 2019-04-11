function __auth_aws_mfa__() {
  local caller_profile_name=$1
  local sts_profile_name=$2
  local serial_number=$3
  local token_code=$4
  [ -z "$(which 2>/dev/null aws)" ] && echo "aws command is not found." && return 1
  [ -z "$(which 2>/dev/null jq)" ]  && echo "jq command is not found." && return 1
  [ -z "$caller_profile_name" ] && echo "Caller profile name is missing." && return 1
  [ -z "$sts_profile_name" ]   && echo "STS profile name is missing." && return 1
  [ -z "$serial_number" ]     && echo "MFA serial number is missing." && return 1
  [ -z "$token_code" ]        && echo "Token code is missing." && return 1
  local json=$(aws --profile "$caller_profile_name" sts get-session-token --serial-number "$serial_number" --token-code "$token_code")
  [ 0 -ne $? ] && return 1
  local access_key_id=$(    echo $json | jq -r .Credentials.AccessKeyId)
  local secret_access_key=$(echo $json | jq -r .Credentials.SecretAccessKey)
  local session_token=$(    echo $json | jq -r .Credentials.SessionToken)
  aws --profile "$sts_profile_name" configure set aws_access_key_id "$access_key_id"
  aws --profile "$sts_profile_name" configure set aws_secret_access_key "$secret_access_key"
  aws --profile "$sts_profile_name" configure set aws_session_token "$session_token"
  export AWS_MFA_EXPIRATION=$(echo $json | jq -r .Credentials.Expiration)
  echo "Credentials is expired at $AWS_MFA_EXPIRATION"
}
