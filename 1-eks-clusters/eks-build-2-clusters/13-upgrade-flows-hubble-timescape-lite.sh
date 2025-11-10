#Install hubble enterprise charts
helm install hubble-enterprise isovalent/hubble-enterprise --version 1.13.0 \
    --namespace kube-system 

sleep 30

#next update for flow export
helm upgrade hubble-enterprise isovalent/hubble-enterprise --version 1.13.0 \
    --namespace kube-system -f hubble-enterprise-values.yaml --wait

sleep 30



#helm upgrade --install hubble-timescape isovalent/hubble-timescape \
#    --version 1.8.0 \
#    --namespace hubble-timescape \
#    --values hubble-enterprise-values.yaml