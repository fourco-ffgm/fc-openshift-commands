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

check your url: `oc whoami --show-console`

```bash
oc create ingress ingr-sakila \
--rule "ingr-sakila.apps.sandbox-m2.ll9k.p1.openshiftapps.com/*=sakila-svc:8080"
```

- oc get ingress
- oc get routes
- oc scale deployment sakila-app --replicas 2
- oc get pods.
- oc scale deployment satir-app --replicas 2
- oc get endpoints

```bash
oc annotate ingress ingr-sakila \
ingress.kubernetes.io/affinity=cookie
```

```bash
for i in {1..2}; do \
curl ingr-sakila.apps.sandbox-m2.ll9k.p1.openshiftapps.com ; done
```

```bash
curl ingr-sakila.apps.sandbox-m2.ll9k.p1.openshiftapps.com \
-c /tmp/cookie_jar
```

- cat /tmp/cookie_jar

```bash
for i in {1..2}; do \
  curl ingr-sakila.apps.sandbox-m2.ll9k.p1.openshiftapps.com -b /tmp/cookie_jar; done
```

```bash
oc annotate route satir \
router.openshift.io/cookie_name="hello"
```

```bash
for i in {1..4}; do \
curl satir-fernando-garciamerlo-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com; done
```

```bash
curl satir-fernando-garciamerlo-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com \
-c /tmp/cookie_jar
```

```bash
for i in {1..3}; do \
curl satir-fernando-garciamerlo-dev.apps.sandbox-m2.ll9k.p1.openshiftapps.com ; done
```