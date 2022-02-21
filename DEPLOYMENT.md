1. Test?

```
Can we test this crossfire build?
```

2. Build Container

```
docker build -f Dockerfile \
    -t blah:latest \
    -t blah:commit-id \
    .
```

3. Push Container

```
docker push blah --all-tags
```

4. Update Secrets
```
kubectl delete secret foo
kubectl create secret foo
```

5. Update Deployment

```
kubectl apply -f path
```

6. ?????

```
export SINGLE_POD_NAME=$(kubectl get pod -l app=name) -o jsonpath="{.items[0].metadata.name}")
kubectl exec -it
```
