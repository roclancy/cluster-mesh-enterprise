MAC OS <br /> 
<br />

What this script will do <br /> 
================================
Contained within this repo is a script to build Cluster Mesh Enterpise Edition. <br>
<br>
Using **<ins>ONE COMMAND</ins>** to install the script will create and install all listed below: <br>
<br>
- Create your Enviroment variables<br>
- Check you have all the requires Isovalent Helm charts and make sure they are up todate <br>
- Build 2 x AWS EKS Clusters, with 2 nodes (by default)<br>
- Configure metrics (prometheus)<br>
- Create a Certifcate Authority, certs <br>
- Install Cert-manager for certificate management (https://cert-manager.io/) and all necessary config files for cert-manager (ie issuers)<br>
- Install Cilium & create all config files needed for cilium
- Configure DNS HA
- Install and configure Hubble Timescape (lite) UI
- Enable flow exporter and perform restarts for daemon
- Install recommended network policies (HTTP and DNS visiblility)
- Install runtime security agents - Tetragon
- 

<br /> 
