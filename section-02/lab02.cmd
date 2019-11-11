
# 1.Istio download site
https://istio.io/docs/setup/#downloading-the-release

# 2.Istio download command script
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.2 sh -

# 3. change directory
cd istio-1.2.2

# 4.Add istio path
vi ~/.bash_profile
export PATH=$PWD/bin:$PATH

source ~/.bash_profile

# 5.Install	istio Customer Resource Definitions
for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done

# 6.Install istio components (Pilot, Mixer, Citadel,…)
kubectl apply -f install/kubernetes/istio-demo.yaml

# 7.Add sidecar injection to default namespace
kubectl label namespace default istio-injection=enabled

# 8. Show labels
kubectl get ns --show-labels

# 9. Show Pods and Services in istio-system
kubectl get pods -n istio-system
kubectl get services -n istio-system

# 10. Copy externalIPs of istio ingressgateway.
"clusterIP": "xxx.xxx.xxx.xxx",
"type": "LoadBalancer",
"externalIPs": [
  "xxx.xxx.xxx.xxx"
],
"sessionAffinity": "None",
"externalTrafficPolicy": "Cluster"

# 11.Show External IP of istio's ingressgateway
kubectl get svc -n istio-system istio-ingressgateway -o wide
