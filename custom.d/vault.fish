function vault_show_secret 
  if not vault token lookup 1>/dev/null
    echo "Not logged in"
    return 1
  end 

  if test (count $argv) -lt 1
    echo "Usage: vault_show_secret <path>"
    return 1
  end 

  set secret (vault kv list -format=json $argv[1] | jq -r .[] | fzf)
  printf "# %s/%s\n" $argv[1] $secret
  vault kv get -format json $argv[1]/$secret | jq .data.data
end 

function vault_show_approles
  for env in dev qa stage prod;
    echo $argv[1]-$env
    echo -n "role_id: "; vault read -field=role_id auth/approle/role/$argv[1]-$env/role-id
    echo -n "secret_id: "; vault write -format=yaml -field=secret_id -f auth/approle/role/$argv[1]-$env/secret-id
  end
end

