#Exercise: Scale and Expose Applications to External Access

```bash
oc create deployment satir-app \
--image docker.io/lmsantosopenshift/do180-httpd-app:v1


oc create deployment sakila-app \
--image docker.io/lmsantosopenshift/do180-httpd-app:v1
```

- oc get pods
- oc status

```bash
oc expose deployment satir-app --name satir-svc \
--port 8080 --target-port 8080

oc expose deployment sakila-app --name sakila-svc \
--port 8080 --target-port 8080
```

- oc get services
- oc get endpoints
- oc get pods –o wide
- oc expose service satir-svc --name satir
- oc get routes

```bash
oc create ingress ingr-sakila \
--rule "ingr-sakila.apps.ocp4.example.com/*=sakila-svc:8080”
```

- oc scale deployment sakila-app --replicas 2
- oc get pods.
- oc get endpoints
