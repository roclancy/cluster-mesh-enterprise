
#update security groups on both clusters

#aws ec2 authorize-security-group-ingress \
#  --group-id sg-abc12345 \
#  --protocol all \
#  --cidr 10.1.0.0/16

#find security groups for each vpc
  aws ec2 describe-security-groups \
  --filters "Name=vpc-id,Values=$VPC_CLUSTER1" \
  --region $REGION \
  --query 'SecurityGroups[*].[GroupName,GroupId]' \
  --output table

 aws ec2 describe-security-groups \
  --filters "Name=vpc-id,Values=$VPC_CLUSTER2" \
  --region $REGION \
  --query 'SecurityGroups[*].[GroupName,GroupId]' \
  --output table