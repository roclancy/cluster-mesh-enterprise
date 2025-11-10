# this will get the elb load balancer address

echo " "
echo " **************************"
echo " **************************"
echo "switching to 1st cluster"
echo " **************************"
echo " **************************"
echo " "

Kubectl config use-context $KUBECLUSTER1
echo " "
echo " *********************************************"
echo "GETTING - SVC DNS Loadbalancer details below for cluster1"
echo " *********************************************"
echo " "
echo " "
echo " Now Got the AWS ELB Name from Cluster 1 and put it in ENV ELBCLUSTER1"
echo " "
export ELBCLUSTER1=$(kubectl get service clustermesh-apiserver --namespace kube-system --output jsonpath='{.status.loadBalancer.ingress[0].hostname}' | sed -e 's/-.*//')
echo $ELBCLUSTER1
echo " "
echo " **************************"
echo " **************************"
echo "switching to 2nd cluster"
echo " **************************"
echo " **************************"
echo " "
Kubectl config use-context $KUBECLUSTER2
echo " "
echo " *********************************************"
echo "GETTING - SVC DNS Loadbalancer details below for cluster2"
echo " *********************************************"
echo " "
echo " "
echo " Now Got the AWS ELB Name from Cluster 2 and put it in ENV ELBCLUSTER2"
echo " "
export ELBCLUSTER2=$(kubectl get service clustermesh-apiserver --namespace kube-system --output jsonpath='{.status.loadBalancer.ingress[0].hostname}' | sed -e 's/-.*//')
echo $ELBCLUSTER2
echo " "
echo " "
echo " "
echo " "
echo " ***************************************************"
echo " ***************************************************"
echo "GETTING from AWS - ELB LOADBALANCER PUBLIC IP ADDRESSES"
echo " ****************************************************"
echo " ****************************************************"
echo " "
echo " "
echo " CLUSTER1 - ELB LOADBALANCER PUBLIC IP ADDRESSES BELOW "
echo " "


export ELB_IP_CLUSTER1=$(aws elb describe-load-balancers \
  --load-balancer-names $ELBCLUSTER1 \
  --query 'LoadBalancerDescriptions[*].DNSName' \
  --output text | xargs dig +short | head -n 1)

echo " "
echo $ELB_IP_CLUSTER1

echo " "
echo " "
echo " CLUSTER2 - ELB LOADBALANCER PUBLIC IP ADDRESSES BELOW "
echo " "

export ELB_IP_CLUSTER2=$(aws elb describe-load-balancers \
  --load-balancer-names $ELBCLUSTER2 \
  --query 'LoadBalancerDescriptions[*].DNSName' \
  --output text | xargs dig +short | head -n 1)

echo " "
echo $ELB_IP_CLUSTER2


