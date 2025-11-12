
#get routing table id for each vpc

echo " "
echo " *****************************************************"
echo " *****************************************************"
echo " NOW FINDING THE MAIN ROUTING TABLE ASSOCIATED WITH"
echo "   EACH CLUSTER VPC"
echo "   CLUSTER1 AND CLUSTER2"
echo " *****************************************************"
echo " *****************************************************"
echo " "


export ROUTING_ID_CLUSTER1=$(aws ec2 describe-route-tables \
  --filters "Name=vpc-id,Values=$VPC_CLUSTER1" "Name=association.main,Values=true" \
  --query "RouteTables[*].RouteTableId" \
  --output text)

  

export ROUTING_ID_CLUSTER2=$(aws ec2 describe-route-tables \
  --filters "Name=vpc-id,Values=$VPC_CLUSTER2" "Name=association.main,Values=true" \
  --query "RouteTables[*].RouteTableId" \
  --output text)
echo " "
echo " *****************************************************"
echo " THESE ARE THE MAIN ROUTING TABLE ID'S"
echo " *****************************************************"
echo " "
echo $ROUTING_ID_CLUSTER1
echo $ROUTING_ID_CLUSTER2



#STEP-2 now add route to the routing table for both clusters

echo " "
echo " *****************************************************"
echo " *****************************************************"
echo " UPDATING THE MAIN ROUTING TABLE TO ALLOW IP ADDRESSES "
echo "   FOR EACH CLUSTER "
echo "   CLUSTER1 AND CLUSTER2"
echo " *****************************************************"
echo " *****************************************************"
echo " "


aws ec2 create-route \
  --route-table-id $ROUTING_ID_CLUSTER1 \
  --destination-cidr-block $POD_CIDR_IP_CLUSTER2 \
  --destination-cidr-block $SVC_CIDR_IP_CLUSTER2 \
  --vpc-peering-connection-id $VPC_PEERING_ID

aws ec2 create-route \
  --route-table-id $ROUTING_ID_CLUSTER2 \
  --destination-cidr-block $POD_CIDR_IP_CLUSTER1 \
  --destination-cidr-block $SVC_CIDR_IP_CLUSTER1 \
  --vpc-peering-connection-id $VPC_PEERING_ID

  echo " "
echo " *****************************************************"
echo " *****************************************************"
echo " ABOVE SHOULD SAY true THIS CONFIRMS THE ROTUING TABLE"
echo " HAS BEEN UPDATED CORRECTLY"
echo " *****************************************************"
echo " *****************************************************"
echo " "
