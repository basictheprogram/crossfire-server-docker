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
```
CF_HOME=/path/on/host/crossfire
docker run --detach \
  --hostname crossfire.your-domain.com \
  --publish 13327:13327
  --name crossfire-server \
  --restart always \
  --volume $CF_HOME/gamefiles:/var/games/crossfire \
  --volume $CF_HOME/logsfiles:/var/log/crossfire \
  --shm-size 256m \
   basictheprogram/crossfire-server:latest
```
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
