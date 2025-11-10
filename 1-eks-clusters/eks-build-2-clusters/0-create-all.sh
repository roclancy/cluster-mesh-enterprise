echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "CLUSTER 1 - CREATING EKS CLUSTER 1"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo " "
echo "****************************************"
echo "CREATING ENV VARIABLES"
echo "****************************************"
echo " "
source 0-create-env.sh
echo " "
source 000a-creating-cluster-yaml-files.sh
echo " "
echo "****************************************"
echo "CHECKING HELM CHARTS ARE INSTALLED AND UPTO DATE"
echo "****************************************"
echo " "
source 00-helm-update.sh
echo " "
echo "****************************************"
echo "CREATING CERTS FOR CA AND KEY USED FOR CLUSTER MESH"
echo "****************************************"
echo " "
source 0a-ca-auth-certs.sh
echo " "
echo "****************************************"
echo "CREATING EKS CLUSTER AND INSTALLING PROEMTHEUS METRICS"
echo "***********************************"
source 1-create-eks-cluster1.sh
source 2-install-prometheus.sh
echo ""
echo "****************************************"
echo "INSTALLING CERT-MANAGER CRD'S"
echo "***********************************"
source 3a-install-cert-manager-CRD.sh
echo " "
echo "****************************************"
echo "INSTALLING CILIUM WITH HELM"
echo "***********************************"
source 5-cluster1-create-cilium-enterprise-values-yaml.sh
source 6-install-cilium-cluster1.sh
echo " "
echo "****************************************"
echo "CREATING NODE GROUP FOR THE EKS CLUSTER"
echo "***********************************"
source 7-cluster1-create-node-grp.sh
sleep 30
echo "***********************************"
echo "INSTALLING CERT-MANAGER & CREATING CERTS"
echo "***********************************"
source 7a-create-certM-issuer-and-secret.sh
sleep 10
source 7b-install-cert-manager.sh
sleep 15
echo " "
echo "****************************************"
echo "CREATING DNS HA, HUBBLE-TIMESCAPE NAMESPACE"
echo "****************************************"
source 8-create-dns-ha.sh
sleep 20

#source 9-create-hubble-namespace.sh

source 9-create-timescape-namespace.sh

#source 10-get-cert-create-config-map.sh
#source 11-install-hubble-ui.sh
echo " "
echo "***********************************"
echo "INSTALLING HUBBLE-TIMESCAPE LITE"
echo "***********************************"
echo " "
source 11-install-timescape-lite.sh
echo "***********************************"
echo "sleep for 60s"
echo "***********************************"
sleep 60
echo " "
echo "***********************************"
echo "CREATING RECOMMEMDED POLICIES"
echo "***********************************"
source 12-create-recommended-network-policies.sh
echo " "
echo "***********************************"
echo "INSTALLING & UPGRADING HUBBLE-ENTERPRISE & SETTING FLOW EXPORT"
echo "***********************************"
source 13-upgrade-flows-hubble-timescape-lite.sh
source 13-restart-daemonset.sh

echo " "
echo "****************************************"
echo "INSTALLING TETRAGON AGENTS"
echo "****************************************"
source 14-deploy-tetragon-k8s.sh

#echo "ENABLING PORT FORWARD FOR HUBBLE-TIMESCAPE-UI (LITE)"
#echo "***********************************"
#source 15-hubble-ui-portforward.sh

#echo "***********************************"
#echo "PUT THIS IN YOUR BROWERS FOR ACCESS TO THE HUBBLE-TIMESCAPE (LITE) UI"
#echo "127.0.0.1:12000"
#echo "***********************************"



#CLUSTER 2 SETUP BELOW
echo " "
echo " "
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "CLUSTER 2 - CREATING EKS CLUSTER 2"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo "****************************************"
echo " "
echo "***********************************"
echo "CHECKING HELM CHARTS ARE INSTALLED AND UPTO DATE"
echo "***********************************"
source 00-helm-update.sh
echo " "
#echo "****************************************"
#echo "CREATING CERTS FOR CA AND KEY USED FOR CLUSTER MESH"
#echo "****************************************"
#echo " "
#does not need to create new certs for cluster2, already created
#source 0a-ca-auth-certs.sh
echo " "
echo "***********************************"
echo "CREATING EKS CLUSTER AND INSTALLING PROEMTHEUS METRICS"
echo "***********************************"
source 1-create-eks-cluster2.sh
source 2-install-prometheus.sh
echo " "
echo "****************************************"
echo "INSTALLING CERT-MANAGER CRD'S"
echo "***********************************"
source 3a-install-cert-manager-CRD.sh
echo " "
echo "***********************************"
echo "INSTALLING CILIUM WITH HELM"
echo "***********************************"
source 5-cluster2-create-cilium-enterprise-values-yaml.sh
source 6-install-cilium-cluster2.sh
echo " "
echo "***********************************"
echo "CREATING NODE GROUP FOR THE EKS CLUSTER"
echo "***********************************"
source 7-cluster2-create-node-grp.sh
sleep 30
echo "***********************************"
echo "INSTALLING CERT-MANAGER & CREATING CERTS"
echo "***********************************"
source 7a-create-certM-issuer-and-secret.sh
sleep 10
source 7b-install-cert-manager.sh
sleep 15
echo " "
echo "***********************************"
echo "CREATING DNS HA, HUBBLE-TIMESCAPE NAMESPACE"
echo "***********************************"
source 8-create-dns-ha.sh
sleep 20

#source 9-create-hubble-namespace.sh

source 9-create-timescape-namespace.sh

#source 10-get-cert-create-config-map.sh
#source 11-install-hubble-ui.sh

echo " "
echo "***********************************"
echo "INSTALLING HUBBLE-TIMESCAPE LITE"
echo "***********************************"
echo " "
source 11-install-timescape-lite.sh
echo "***********************************"
echo "sleep for 60s"
echo "***********************************"
sleep 60
echo " "
echo "***********************************"
echo "CREATING RECOMMEMDED POLICIES"
echo "***********************************"
source 12-create-recommended-network-policies.sh
echo " "
echo "***********************************"
echo "INSTALLING / UPGRADING HUBBLE-ENTERPRISE & SETTING FLOW EXPORT"
echo "***********************************"
source 13-upgrade-flows-hubble-timescape-lite.sh
source 13-restart-daemonset.sh
echo " "
echo "***********************************"
echo "INSTALLING TETRAGON AGENTS"
echo "***********************************"
source 14-deploy-tetragon-k8s.sh
echo " "
echo " "
echo "*****************************************************************"
echo " "
echo " NOW CONNECTING CLUSTERS WITH CLUSTER MESH"
echo " pulling all necessary config & testing clusters connected"
echo " " 
echo "*****************************************************************"
source 15-create-connections-clustermesh.sh
echo " "
echo " " 
cho "*****************************************************************"
echo " "
echo " NOW CHANGING THE AWS SECURITY TO ALLOW TRAFFIC FOR AWS"
echo "         CLUSTERAPI LOADBALANCERS"
echo " " 
echo "*****************************************************************"
echo " "
source 0-create-open-security-groups.sh
echo " "
sleep 30
echo " SLEEPING FOR 30 SECONDS"
echo " "
echo " "
echo "***********************************"
echo "ENABLING PORT FORWARD FOR HUBBLE-TIMESCAPE-UI (LITE)"
echo "***********************************"
source 16-hubble-ui-portforward.sh
echo " "
echo "***********************************"
echo "PUT THIS IN YOUR BROWERS FOR ACCESS TO THE HUBBLE-TIMESCAPE (LITE) UI"
echo "127.0.0.1:12000"
echo "***********************************"

