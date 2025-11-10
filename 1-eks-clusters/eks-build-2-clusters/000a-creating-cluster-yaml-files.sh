
echo " **********************************************"
echo " **********************************************"
echo " "
echo " CREATING FILES "
echo " for EKS cluster1, cluster2.yaml files "
echo " and cluster node groups for each clusters"
echo " "
echo " **********************************************"
echo " **********************************************"

cat > cluster1.yaml <<EOF

apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: ${CLUSTER_NAME1}
  region: ${REGION}
  version: "1.31"

iam:
  withOIDC: true

addonsConfig:
  disableDefaultAddons: true
addons:
 - name: coredns
EOF

cat > cluster2.yaml <<EOF

apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: ${CLUSTER_NAME2}
  region: ${REGION}
  version: "1.31"

iam:
  withOIDC: true

addonsConfig:
  disableDefaultAddons: true
addons:
 - name: coredns
EOF


cat > nodegroup-cluster1.yaml <<EOF
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: ${CLUSTER_NAME1}
  region: ${REGION}

managedNodeGroups:
- name: standard
  instanceType: m5.large
  desiredCapacity: 2
  privateNetworking: true
EOF

cat > nodegroup-cluster2.yaml <<EOF
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: ${CLUSTER_NAME2}
  region: ${REGION}

managedNodeGroups:
- name: standard
  instanceType: m5.large
  desiredCapacity: 2
  privateNetworking: true
EOF
