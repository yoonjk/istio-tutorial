
# 1.Show Pods of demo application
kubectl get pods

# 2. change directory
cd istio-1.2.2

# 3.Deploy bookinfo microservices to kubernetes
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

# 4.Setup Gateway and VirtualService of istio to istiogateway and productpage microservice
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml

# 5. Setup DestinationRule of istio to bookinfo microservices
kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml

# 6. Make script file to generate serivces' traffic
[gen-traffic.sh]
#!/bin/bash
GATEWAY_URL=$1
echo “Public IP:” $GATEWAY_URL
while true
do
  curl -s -o /dev/null http://$GATEWAY_URL/productpage
  sleep 1
done


# 7.Change permission
chmod 755 ./gen-traffic.sh
