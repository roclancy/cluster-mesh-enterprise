eksctl create cluster -f cluster2.yaml

export KUBECLUSTER2=$(kubectl config current-context) 
echo $KUBECLUSTER2
