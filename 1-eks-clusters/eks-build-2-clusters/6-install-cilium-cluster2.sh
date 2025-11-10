echo "INSTALLING CILIUM"

helm install cilium isovalent/cilium --version 1.17.9 --namespace kube-system -f cilium-enterprise-values-cluster2.yaml --timeout 90s --debug || true

#--debug 

echo " "
echo "****************************************"
echo "****************************************"
echo "THE ABOVE ERROR MESSAGE IS BECAUSE THE" 
echo "NODES HAVE NOT BEEN CREATED, & THE POD"
echo " FOR THE CERT IS WAITING TO BE ASSIGNED"
echo "****************************************"
echo "****************************************"
echo " "


#helm upgrade -i cilium isovalent/cilium --version 1.17.7 --namespace kube-system -f cilium-enterprise-values.yaml --debug
#--timeout 600s --debug

#echo "SLEEPING 30 SECONDS"
#sleep 30


#helm upgrade -i cilium isovalent/cilium --version 1.17.7 \
#		--namespace kube-system --timeout 30s -f - || true

#helm install cilium isovalent/cilium --version 1.17.7 --namespace kube-system --values -f cilium-enterprise-values.yaml
