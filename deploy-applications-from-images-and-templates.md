# Exercise: Deploy Applications from Images and Templates

- oc describe template mysql-persistent -n openshif

```bash
oc new-app -l team=red --template mysql-persistent \
-p MYSQL_USER=developer \
-p MYSQL_PASSWORD=developer
```

- oc get pods

```bash
oc new-app --name db-image -l team=blue \
--image docker.io/centos/mysql-80-centos8 \
-e MYSQL_USER=developer \
-e MYSQL_PASSWORD=developer \
-e MYSQL_ROOT_PASSWORD=redhat
```

- oc get pods -L team
  
```bash
oc get pods -l deploymentconfig=mysql \
-o jsonpath='{.items[0].spec.containers[0].readinessProbe}' | jq
```

```bash
oc get pods -l deployment=db-image \
-o jsonpath='{.items[0].spec.containers[0].readinessProbe}' | jq
```

```bash
oc get pods -l deploymentconfig=mysql \
-o jsonpath='{.items[0].spec.containers[0].resources.limits}' | jq
```

```bash
oc get pods -l deployment=db-image \
-o jsonpath='{.items[0].spec.containers[0].resources}' | jq
```

- oc get secrets
- oc get services
- oc get services -l team=red
- oc get services -l team=blue
- oc get pods -l team=red
- oc delete all -l team=red
- oc delete secret,pvc -l team=red
- oc get secret,svc,pvc,dc -l team=red
- oc get is,deployment,svc
- oc delete all -l team=blue
