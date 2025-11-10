echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo "CONNECTING CLUSTERS Helm Upgrade,"
echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo " "


helm upgrade --kube-context "$KUBECLUSTER1" \
  cilium isovalent/cilium --version 1.17.9 \
  --namespace kube-system --reuse-values \
  --values clustermesh-config.yaml \
  --timeout 90s

helm upgrade --kube-context "$KUBECLUSTER2" \
  cilium isovalent/cilium --version 1.17.9 \
  --namespace kube-system --reuse-values \
  --values clustermesh-config.yaml \
  --timeout 90s