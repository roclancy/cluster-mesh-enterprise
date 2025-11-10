#kubectl port-forward -n hubble-ui svc/hubble-ui 12000:80 &

#port forward - for timescape LITE

#install docs 
# https://docs.isovalent.com/v1.17/operations-guide/hubble/hubble-timescape/lite_install.html

kubectl port-forward -n hubble-timescape svc/hubble-timescape-ui 12000:80 &

