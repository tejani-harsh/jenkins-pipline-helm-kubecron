```
docker build -t tejaniharsh/web-app-image:latest .
docker push tejaniharsh/web-app-image:latest
```

# Part 3

```
cd
cd part3
helm install release1 . 
helm install release2 . 
```

```
helm uninstall release1
helm uninstall release2
```

# Part 4

```
k delete cronjob check-pending-pod
k delete pod pending-demo
```

```
cd part4
k apply -f pending.yaml
k apply -f cron.yaml
```# jenkins-pipline-helm-kubecron
