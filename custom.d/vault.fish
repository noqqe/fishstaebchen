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
