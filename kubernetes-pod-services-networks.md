# Exercise: Kubernetes Pod and Service Networks

```bash
oc create deployment db-pod --port 3306 \
--image docker.io/centos/mysql-80-centos8
```

```bash
oc set env deployment/db-pod \
MYSQL_USER=user1 \
MYSQL_PASSWORD=mypa55w0rd \
MYSQL_DATABASE=items
```

- oc get pods
- oc get deployments
- oc expose deployment/db-pod
- oc get service db-pod -o wide

```bash
PODNAME=$(oc get pods \
-o jsonpath='{.items[0].metadata.name}’)
```

- oc get pod $PODNAME --show-labels
- oc get endpoints
  
```bash
oc run shell -it \
--image docker.io/shichw/network-tools-rhel8
```

- cat /etc/resolv.conf

```bash
nc -z db-pod.fernando-garciamerlo-dev 3306 && \
echo "Connection success to db-pod.fernando:3306" || \
echo "Connection failed"
```

- exit
- oc delete pod shell

```bash
oc create job mysql-init \
--image docker.io/lmsantosopenshift/do180-dbinit \
-- /bin/bash -c "mysql -uuser1 -pmypa55w0rd --protocol tcp \
-h db-pod -P3306 items </tmp/db-init.sql”
```

- oc get jobs
- oc get pods
- oc delete job mysql-init
  
```bash
oc run query-db -it --rm \
--image docker.io/lmsantosopenshift/do180-dbinit  \
--restart Never \
-- mysql -uuser1 -pmypa55w0rd --protocol tcp \
-h db-pod -P3306 items -e 'select * from Item;’
```

```bash
POD_IP=$(oc get pod -l app=db-pod \
- -o jsonpath='{.items[0].status.podIP}’)
```

```bash
oc run shell --env POD_IP=$POD_IP -it --rm \
--image docker.io/shichw/network-tools-rhel8 \
--restart Never \
-- nc -z $POD_IP 3306 && echo "Connection success to $POD_IP:3306" \
|| echo "Connection failed"
```
