
#kubectl -n kube-system create secret tls cilium-ca --cert=cilium-ca-crt.pem --key=cilium-ca-key.pem

kubectl -n kube-system create secret tls cilium-ca-1 --cert=cilium-ca-crt.pem --key=cilium-ca-key.pem

kubectl apply -f cilium-issuer.yaml

kubectl get issuer -n kube-system

