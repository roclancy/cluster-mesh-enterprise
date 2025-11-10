
echo " *************************************************************** "
echo " *************************************************************** "
echo " "
echo "FINDING AWS SECURITY GROUPS FOR EACH CLUSTERMESH API LOADBALANCER"
echo " "
echo " *************************************************************** "
echo " *************************************************************** "

source find-sg-for-loadbalancer.sh

echo " *************************************************************** "
echo " *************************************************************** "
echo " "
echo "NOW - ALLOWING TAFFIC THROUGH AWS SECURITY"
echo " GROUPS FOR EACH CLUSTERMESH API LOADBALANCER"
echo " "
echo " *************************************************************** "
echo " *************************************************************** "

source change-security-group-allow-all.sh

echo " *************************************************************** "
echo " *************************************************************** "
echo " "
echo " COMPLETE NOW - ALL IPV4 TRAFFIC ALLOWED THROUGH EACH CLUSTERMESH API"
echo " LOADBALANCER -- WARNING ONLY DO THIS FOR TESTING / DEMO REASONS"
echo " "
echo " *************************************************************** "
echo " *************************************************************** "
