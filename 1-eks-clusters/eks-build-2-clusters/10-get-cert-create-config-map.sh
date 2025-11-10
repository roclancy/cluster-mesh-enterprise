kubectl -n kube-system get secrets hubble-relay-server-certs --template '{{ index .data "ca.crt" }}' | base64 -d > eks-hubble-relay-ca.crt

sleep 10

kubectl -n hubble-ui create configmap hubble-relay-ca \
--from-file=ca.crt=eks-hubble-relay-ca.crt \
--dry-run=client \
-o yaml | \
kubectl apply -f -
