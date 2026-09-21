# Aliases for kubernetes 

if command -q kubectl; 
  alias k=kubectl
end

if command -q kubie; 
  alias kn="kubie ns"
end

if command -q helm; 
  alias h=helm
end


function kubernetes_show_pod_ports
  for pod in $argv
    echo Pod $pod:
    kubectl get pod $pod -o jsonpath='Host:{.status.hostIP} PodIP:{.status.podIP} PodPorts:{.spec.containers[*].ports[*].containerPort}'
    echo
  end
end

function kubernetes_show_secrets
  if not kubectl auth can-i get secrets &>/dev/null
    echo "You don't have permissions to view secrets"
    return 1
  end

  set -l secret (kubectl get secrets -o json | jq -r .items[].metadata.name | fzf)
  echo Secret $secret:
  kubectl get secret $secret -o go-template='{{range $k,$v := .data}}{{printf " %s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
end

function kubernetes_show_node_ips
    set podjson (kubectl get pods --all-namespaces -o json)

    kubectl get nodes -o json | jq -r '.items[].metadata.name' | while read -l node
        set stats (echo $podjson | jq -r --arg node "$node" '
          [.items[] | select(.spec.nodeName == $node)] as $p |
          "\($p | length)\t\([$p[] | select(.status.podIP != null) | .status.podIP] | unique | length)"
        ')
        set capacity (kubectl get node "$node" -o jsonpath='{.status.allocatable.pods}')
        echo -e "$node\tPods: $stats[1]/$capacity\tUnique IPs: $stats[2]"
    end | column -t
end
