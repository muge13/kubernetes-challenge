kubectl kustomize . > compiled.yml
kubectl apply -f compiled.yml