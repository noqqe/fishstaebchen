# my tiny aws secrets fetcher
function aws_show_secret
  if not aws sts get-caller-identity &>/dev/null
    echo "Not logged in"
    return 1
  end
  set name (aws secretsmanager list-secrets | jq -r .SecretList[].Name | fzf)
  aws secretsmanager get-secret-value --secret-id $name | jq -r '.SecretString| fromjson'
end
