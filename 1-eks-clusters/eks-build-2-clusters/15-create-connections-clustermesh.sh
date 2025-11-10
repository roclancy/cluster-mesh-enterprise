echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo "CONNECTING CLUSTERS,"
echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo " "
source 1a-get-loadbalancer-details.sh
echo " "
source 1b-create-clustermesh-config-yaml.sh
echo " "
source 1c-connect-clusters.sh

sleep 20

echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo "RESTARTING CILIUM DAEMON"
echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
source 2-restart-daemonset.sh
echo "**********************************************"
echo "**********************************************"
echo " "
echo " Sleeping for 60 seconds- Hold Tight "
echo "we'll test the clustermesh has connected the clusters next "
echo "**********************************************"
echo "**********************************************"
sleep 60
echo " "
echo " "
echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
echo "STATUS CHECKS FOR CILIUM CLUSTER MESH"
echo " "
echo "**********************************************"
echo "**********************************************"
echo " "
source 3-status-check-clustermesh.sh
echo " "
echo " "
echo " "


