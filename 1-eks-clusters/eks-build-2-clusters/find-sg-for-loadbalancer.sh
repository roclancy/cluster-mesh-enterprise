


SG_ID_CLUSTER1=$(aws elb describe-load-balancers \
  --load-balancer-names $ELBCLUSTER1 \
  --query 'LoadBalancerDescriptions[0].SecurityGroups[0]' \
  --output text)

echo $SG_ID_CLUSTER1


SG_ID_CLUSTER2=$(aws elb describe-load-balancers \
  --load-balancer-names $ELBCLUSTER2 \
  --query 'LoadBalancerDescriptions[0].SecurityGroups[0]' \
  --output text)

echo $SG_ID_CLUSTER2