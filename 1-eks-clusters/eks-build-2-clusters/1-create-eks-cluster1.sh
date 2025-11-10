eksctl create cluster -f cluster1.yaml

export KUBECLUSTER1=$(kubectl config current-context) 
echo $KUBECLUSTER1

