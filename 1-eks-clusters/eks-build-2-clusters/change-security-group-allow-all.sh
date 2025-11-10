


aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID_CLUSTER1 \
  --protocol -1 \
  --cidr 0.0.0.0/0

  aws ec2 authorize-security-group-ingress \
  --group-id $SG_ID_CLUSTER2 \
  --protocol -1 \
  --cidr 0.0.0.0/0

