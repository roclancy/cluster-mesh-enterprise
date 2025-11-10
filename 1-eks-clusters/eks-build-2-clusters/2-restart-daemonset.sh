#to restart the hubble-timescape daemon set

Kubectl config use-context $KUBECLUSTER1

kubectl rollout restart daemonset cilium -n kube-system

kubectl rollout restart deployment cilium-operator -n kube-system

kubectl rollout restart deployment clustermesh-apiserver -n kube-system

#sleep 5

Kubectl config use-context $KUBECLUSTER2

kubectl rollout restart daemonset cilium -n kube-system

kubectl rollout restart deployment cilium-operator -n kube-system

kubectl rollout restart deployment clustermesh-apiserver -n kube-system


