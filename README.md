**CLUSTER MESH<BR>
ENTERPRISE EDITION - HELM INSTALL**
----------------------------------------------------

Tested on MAC OS <br /> 
<br />

1 - What this script will do <br /> 
================================
Contained within this repo is a script to build Cluster Mesh Enterpise Edition. <br>
<br>
Everying listed below is automated using **<ins>ONE COMMAND</ins>** to install <br>
<br>
I have listed below in two phases to just to explain, the script is all automated and you only need to run one command to do everything
the script will create and install all listed below:<br>

Phase 1 - Build - 2 (Two) EKS Clusters & deploy all needed config
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

Phase 2 - Connect - 2 (Two) EKS clusters with ClusterMesh
=======
This phase finalises the creation of cluster mesh and connects the new 2 x EKS clusters, this is all automated and is just for explantion for whats happening, you do not need to do anything<br>
- Now it will find the newly created clustermesh-apiserver AWS loadbalancer external DNS name for both EKS clusters <br>
- Next it will interogate the AWS loadbalancers to obtain the public IP address for the newly created loadbalancers for each clustermesh-apiserver based on the DNS name we found above<br>
- Now it will create the clustermesh-config.yaml file and put the AWS loadbalancer public IP addresses we found in the two steps above<br>
- Now it will move to connected the 2 new EKS Clusters, Using Helm upgrade it will enable clustermesh<br>
- Next it will restart daemon sets and deployments to take about of the new changes
- Finally it will test Cluster Mesh status and print out details to show it has now connected the 2 new EKS Clusters
- Next it will run a script to find the AWS security groups assigned to the clustermesh-apiserver loadbalancers
- Using the AWS Security group for each clusters AWS loadbalancers found it will change the rules associated with the security group to allow all traffic
- Port forwarding is now enabled for Hubble Timescape (lite) UI<br>
<br>

2 - Steps to Install
=====================
<br>
Follow the instructions below to create all<br>
<br>
Make sure you have all CLI's listed here installed, kubectl, aws, eksctl and helm CLI tools should be installed <br />
https://docs.isovalent.com/v1.17/operations-guide/installation/eks-install.html#requirements <br />
<br>
1 - Clone this repo<br>
2 - Change to directory 1-eks-clusters/eks-build-2-clusters<br>
3 - Edit file called "0-create-env.sh" - change (or leave as is) to your required cluster name, cluster ID and AWS region, SAVE your changes<br>
4 - Now run command "source 0-create-all.sh" this will create everything<br>
5 - The script will now run, this takes about 40 - 45 mins to install and become active (mainly due to waiting for AWS to build resources)<br>
<br>
Once installed you can access the UI with URL http://127.0.0.1:12000/<br>

<br>
<br>
Below are some screen shots of the outcome of the installation<br>
--------------------------------------------------------------

<br>
Cilium Cluster Mesh status checks, showing that cluster mesh is active and the 2 eks clusters are connected is shown below:
<br>
<br>
<img width="1028" height="612" alt="image" src="https://github.com/user-attachments/assets/5472eae2-cebd-4e62-b1c7-8751dbec7d40" />
<br>

<br>
Hubble Timescape (lite) showing both clusters ( named cluster1 & cluster in the image)<br>
<br>
<img width="1493" height="824" alt="image" src="https://github.com/user-attachments/assets/d9b3c3ab-75f5-44f5-bcd4-f80332530b20" />

<br>
Pods Running - kubectl get pods --all-namespaces<br>
<br>
<img width="739" height="453" alt="image" src="https://github.com/user-attachments/assets/1d97e7ee-2574-4754-84cd-0d4e6dcb12dc" />
<br>
<br /> 

NOTE: Warning & Error Messages<br /> 
========================
<br /> 
You will see an warning and error message during the install, this is due to a number of things order of install, and waiting for pods to get created <br />
I have put a lot of information during the installation process for you to see what is happening, all will install correct do not stop the script the messages do not interfere with the finals outcome <br />
<br />
Below is an example of notes I have added to the install script to highlight warning / error messages during the install: <br />
<br />
<img width="719" height="271" alt="image" src="https://github.com/user-attachments/assets/4581ead3-6806-40d8-9569-bc405c4d8c4a" />
<br />
<br />
<br />

