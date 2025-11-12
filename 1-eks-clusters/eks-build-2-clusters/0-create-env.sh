
export CLUSTER_NAME1="cluster1"
export CLUSTER_ID1=1

export CLUSTER_NAME2="cluster2"
export CLUSTER_ID2=2

export REGION=eu-north-1

#For Cluster Mesh to work it requires you have unique IP for each cluster, POD CIDR & ServiceCDIR
export POD_CIDR_IP_CLUSTER1=10.1.0.0/16
export POD_CIDR_IP_CLUSTER2=10.2.0.0/16
export SVC_CIDR_IP_CLUSTER1=10.3.0.0/16
export SVC_CIDR_IP_CLUSTER2=10.4.0.0/16
