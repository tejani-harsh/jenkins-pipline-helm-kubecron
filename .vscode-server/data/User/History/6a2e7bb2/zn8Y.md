```
docker build -t tejaniharsh/web-app-image:latest .
docker push tejaniharsh/web-app-image:latest
k delete cronjob check-pending-pod
k delete pod pending-demo



```