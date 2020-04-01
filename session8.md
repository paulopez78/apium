<!-- * Manual Deployments with ReplicaSets (20 min)
* Deployments: minReadySeconds, maxSurbe, minAvailable (40 min) -->
* Manual Ingress with configmaps/secrets (20 min)
* Ingress controller (nginx/traefik) (40 min)
* Dashboard install (10 min)
* Resources (15 min)

# ingress
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --port 8080 --target-port 80
kubectl create configmap nginx-conf --from-file ./nginx/nginx.conf

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml

kubectl apply -f k8s/votingapp-ingress.yaml
curl -H "Host: votingapp.io" localhost