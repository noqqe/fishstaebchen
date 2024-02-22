# Aliases for kubernetes 

if command -q kubectl; 
  alias k=kubectl

end

if command -q helm; 
  alias h=helm
end


function k_get_pod_ports
  for pod in $argv
    echo Pod $pod:
    kubectl get pod $pod -o jsonpath='Host:{.status.hostIP} PodIP:{.status.podIP} PodPorts:{.spec.containers[*].ports[*].containerPort}'
    echo
  end
end

function k_get_secret
  for secret in $argv
    echo Secret $secret:
    kubectl get secret $secret -o go-template='{{range $k,$v := .data}}{{printf " %s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
  end
end
