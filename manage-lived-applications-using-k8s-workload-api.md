# Exercise: Manage Long-lived and Short-lived Applications by Using the Kubernetes Workload API

- oc create deployment my-db --image docker.io/centos/mysql-80-centos8
- oc get deployments.
- oc get pods.
- oc logs deploy/my-db

```bash
oc set env deployment/my-db \
MYSQL_USER=developer \
MYSQL_PASSWORD=developer \
MYSQL_DATABASE=sampled
```

- oc get deployments
- oc get pods -o wide
  
```bash
oc run -it db-test --restart=Never \
--image docker.io/centos/mysql-80-centos8 \
-- mysql sampledb -h 10.128.8.80 -u developer --password=developer \
-e "select 1;”
```

- oc delete pod -l app=my-db

```bash
oc create job date-loop \
--image docker.io/redhat/ubi9 \
-- /bin/bash -c "for i in {1..30}; do date; done"
```

- oc get job date-loop -o yaml
- oc get jobs
- oc logs job/date-loop
- oc delete pod -l job-name=date-loop
- oc get pod -l job-name=date-loop
- oc get job -l job-name=date-loop
- oc delete deployment my-db
- oc delete pod db-test