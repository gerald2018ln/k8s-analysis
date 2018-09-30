# k8s-analysis

![Docker Automated](https://img.shields.io/docker/automated/gerald1248/k8s-analysis.svg)
![Docker Build](https://img.shields.io/docker/build/gerald1248/k8s-analysis.svg)

Analysis pod for debugging: deploy within your project and run `ab`, `dig`, `netstat`, `nslookup`, `telnet`, `traceroute`, `wget`, and so on as well as database clients for MySQL and PostgreSQL.

## Quick start
Run the analysis container from Docker Hub as follows:
```
$ kubectl run k8s-analysis -i --tty --rm --image=gerald1248/k8s-analysis
```

## For repeated use...
```
$ make install
helm install --name=k8s-analysis .
NAME:   k8s-analysis
LAST DEPLOYED: Mon Oct  1 00:12:28 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME          AGE
k8s-analysis  0s

==> v1/Pod(related)

NAME                           READY  STATUS             RESTARTS  AGE
k8s-analysis-6d76cfddb5-7s42l  0/1    ContainerCreating  0         0s
$ kubectl get po
NAME                                    READY     STATUS      RESTARTS   AGE
k8s-analysis-6d76cfddb5-7s42l           1/1       Running     0          1m
$ kubectl exec -it k8s-analysis-6d76cfddb5-7s42l -- /bin/sh
/app $
```

## Cleanup
```
$ make delete
helm delete --purge k8s-analysis
release "k8s-analysis" deleted
```
