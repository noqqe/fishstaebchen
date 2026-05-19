# my tiny aws secrets fetcher
function aws_show_secret
  if not aws sts get-caller-identity &>/dev/null
    echo "Not logged in"
    return 1
  end
  set name (aws secretsmanager list-secrets | jq -r .SecretList[].Name | fzf)
  set value "$(aws secretsmanager get-secret-value --secret-id $name |jq -r '.SecretString')"
  if echo $value | jq -e . &>/dev/null 
    echo $value | jq -r '.'
  else
    echo $value 
  end 
end

# my tiny aws ssm fetcher
function aws_show_ssm
  if not aws sts get-caller-identity &>/dev/null
    echo "Not logged in"
    return 1
  end
  set name (aws ssm describe-parameters | jq -r .Parameters[].Name | fzf)
  set value "$(aws ssm get-parameter --with-decryption --name $name |jq -r '.Parameter | {Name,Value}')"
  if echo $value | jq -e . &>/dev/null 
    echo $value | jq -r '.'
  else
    echo $value 
  end 
end
