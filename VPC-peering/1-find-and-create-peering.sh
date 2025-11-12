echo " ***************************************************"
echo " ***************************************************"
echo " FINIDING VPC FOR EACH CLUSTER TO CREATE PEERING"
echo " ***************************************************"
echo " ***************************************************"

export VPC_CLUSTER1=$(aws eks describe-cluster --name $CLUSTER_NAME1 --query "cluster.resourcesVpcConfig.vpcId" --output text)

export VPC_CLUSTER2=$(aws eks describe-cluster --name $CLUSTER_NAME2 --query "cluster.resourcesVpcConfig.vpcId" --output text)
echo " "
echo " "
echo $VPC_CLUSTER1
echo $VPC_CLUSTER2
echo " "
echo " "
echo " *****************************************************"
echo " *****************************************************"
echo " NOW CREATING PEERING CONNECTIONS FOR BOTH CLUSTER VPC'S"
echo "   AND ACCEPTING IT "
echo "   AND CHECKING STATUS IS ACTIVE"
echo " *****************************************************"
echo " *****************************************************"
echo " "

export VPC_PEERING_ID=$(aws ec2 create-vpc-peering-connection \
  --vpc-id "$VPC_CLUSTER1" \
  --peer-vpc-id "$VPC_CLUSTER2" \
  --region "$REGION" \
  --tag-specifications 'ResourceType=vpc-peering-connection,Tags=[{Key=Name,Value=eks-peering-cluster1-to-cluster2}]' \
  --no-cli-pager \
  --query 'VpcPeeringConnection.VpcPeeringConnectionId' \
  --output text)

echo " "
echo " VPC PEERING ID CREATED BELOW"
echo " "
echo $VPC_PEERING_ID
echo " "
echo " "

#now accept the peering
aws ec2 accept-vpc-peering-connection \
  --vpc-peering-connection-id $VPC_PEERING_ID \
  --region $REGION \
  --no-cli-pager

#check status of peering connection
aws ec2 describe-vpc-peering-connections \
  --vpc-peering-connection-ids $VPC_PEERING_ID \
  --query "VpcPeeringConnections[*].Status" \
  --no-cli-pager

