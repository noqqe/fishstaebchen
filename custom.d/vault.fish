function vault_show_secret 
  if not vault token lookup 1>/dev/null
    echo "Not logged in"
    return 1
  end 
  set secret (vault kv list -format=json $argv[1] | jq -r .[] | fzf)
  vault kv get -format json $argv[1]/$secret | jq .data.data
end 
