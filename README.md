MAC OS <br /> 
<br />

What this script will do <br /> 
================================
Contained within this repo is a script to build Cluster Mesh Enterpise Edition. <br>
<br>
Everying listed below is automated (phase 1 & 2) using **<ins>ONE COMMAND</ins>** to install, the script will create and install all listed below: <br>
<br>

Phase 1 - Build 2 x EKS Clusters & deploy all needed config
=======
- Create your Enviroment variables<br>
- Check you have all the requires Isovalent Helm charts and make sure they are up todate <br>
- Build 2 (two) x AWS EKS Clusters, with 2 nodes (by default)<br>
- Configure metrics (prometheus)<br>
- Create a Certifcate Authority, certs <br>
- Install Cert-manager for certificate management (https://cert-manager.io/) and all necessary config files for cert-manager (ie issuers)<br>
- Install Cilium & create all config files needed for cilium
- Configure DNS HA
- Install and configure Hubble Timescape (lite) UI
- Enable flow exporter and perform restarts for daemon
- Install recommended network policies (HTTP and DNS visiblility)
- Install runtime security agents - Tetragon

Phase 2 - Connect the 2 EKS clusters with ClusterMesh
=======
This phase requires additional aspectsm, which are all automated this is just for explantion, you do not need to do anything<br>
- Now it will find the newly created clustermesh-apiserver AWS loadbalancer external DNS name for both EKS clusters <br>
- Next it will interogate the AWS loadbalancers to obtain the public IP address for the newly created loadbalancers for each clustermesh-apiserver based on the DNS name we found above<br>
- Now it will create the clustermesh-config.yaml file and put the AWS loadbalancer public IP addresses we found in the two steps above<br>
- Now it will move to connected the 2 new EKS Clusters, Using Helm upgrade it will enable clustermesh<br>
- Next it will restart daemon sets and deployments to take about of the new changes
- Finally it will test Cluster Mesh status and print out details to show it has now connected the 2 new EKS Clusters
- 

<br /> 
