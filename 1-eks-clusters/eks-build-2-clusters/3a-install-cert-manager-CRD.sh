# doc link to get cert-manager CRD's
# https://cert-manager.io/docs/installation/helm/#option-1-installing-crds-with-kubectl
# Installing CRD before deloying cert-manager due to cilium cni issue of not creating nodes and therefore cert-manager pods

#helm install \
#  cert-manager oci://quay.io/jetstack/charts/cert-manager \
#  --version v1.19.1 \
#  --namespace cert-manager \
#  --create-namespace \
#  --set crds.enabled=true

helm repo add jetstack https://charts.jetstack.io --force-update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.19.1 \
  --set crds.enabled=true \
  --timeout 60s


echo "*************************************************"
echo "*************************************************"
echo " THE ABOVE ^^^^ ERROR IS DUE TO NO NODEs CREATED"
echo " THE CERT-MANAGER POD IS CREATED LATER"
echo " IGNORE THIS ERROR MESSAGE"
echo "*************************************************"
echo "*************************************************"