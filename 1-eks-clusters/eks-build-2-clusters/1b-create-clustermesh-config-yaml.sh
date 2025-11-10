
echo " **********************************************"
echo " **********************************************"
echo " "
echo " CREATING THE clustermesh-config.yaml FILE "
echo " - configuring the Loadbalancer PUBLIC IP "
echo " "
echo " **********************************************"
echo " **********************************************"

cat > clustermesh-config.yaml <<EOF

clustermesh:
  config:
    enabled: true
    clusters:
    - name: cluster1
      ips:
      - ${ELB_IP_CLUSTER1}
      port: 2379
    - name: cluster2
      ips:
      - ${ELB_IP_CLUSTER1}
      port: 2379
EOF
