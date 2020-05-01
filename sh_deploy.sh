kubectl kustomize . > compiled.yml
kubectl apply -f compiled.yml

echo "Waiting for service to launch on minikube IP..."
while ! nc -z $(minikube ip) 80; do   
  sleep 1
  printf "-"
done
echo "Service launched"
echo "Waiting for service to become live"
string="Hello"
while ! curl -s $(minikube ip)| grep -q "$string"; do   
  sleep 1 
  printf "-"
done
echo 
echo "Service Live"
curl $(minikube ip)
echo