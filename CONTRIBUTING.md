# Boilerplate
# Development Workflow
## Build
```
docker build -t crossfire-server-docker .
docker compose up --build
docker tag basictheprogram/xxx:yyy  basictheprogram/xxx:yyy
```
## Run
### Development
```
docker run -it --entrypoint "/bin/bash" basictheprogram/crossfire-server
```
### Production

## Publish
### Docker
```
docker push basictheprogram/xxx:tag
```
### Kubernetes
```
kubectl apply -f k8s/nginx/deployment.yml
kubectl get deployments
kubectl get deployments nginx-deployment
kubectl get pods
kubectl exec -it <podname> -- /bin/bash
kubectl delete -f k8s/nginx/deployment.yml
kubectl get service
kubectl get service <servicename> -o yaml
```
## Clean up/Periodic Maintenance
```
docker system prune -a
```

# Docker on Windows
I recommend installing [chocolatey](https://chocolatey.org/install) to make
installation and upgrading docker simple. Open a Administrator level powershell
```
choco install docker-desktop
```
Keep the docker app up to date
```
cup all
```
