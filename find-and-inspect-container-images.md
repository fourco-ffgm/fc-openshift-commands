# Exercise: Find and Inspect Container Images

- skopeo list-tags docker://quay.io/redhattraining/docker-nginx
- oc run docker-nginx --image docker.io/lmsantosopenshift/docker-nginx
- oc logs docker-nginx
- ls -la /etc/ | grep nginx
- ls -la /var/cache | grep nginx
- whoami
- ./skopeo inspect --config docker://docker.io/lmsantosopenshift/docker-nginx
- oc delete pod docker-nginx
- ./skopeo inspect --config docker://docker.io/lmsantosopenshift/docker-nginx
- oc run bitnami-mysql --image docker.io/lmsantosopenshift/bitnami-mysql
- oc get pods
- oc logs  bitnami-mysql
- oc delete pod bitnami-mysql

```bash
oc run bitnami-mysql \
--image docker.io/lmsantosopenshift/bitnami-mysql \
--env MYSQL_ROOT_PASSWORD=redhat123
```

- oc exec -it bitnami-mysql -- /bin/bash -c "whoami && id"
- oc describe project <project-name>
  
```bash
oc run rhel9-mysql \
--image docker.io/lmsantosopenshift/mysql-80:1-237 \
--env MYSQL_USER=redhat \
--env MYSQL_PASSWORD=redhat123 \
--env MYSQL_DATABASE=worldx
```

- oc logs rhel9-mysql
- oc image info docker.io/lmsantosopenshift/mysql-80:1-237
- oc exec -it rhel9-mysql -- ls -la /var/lib/mysql
- oc get pods rhel9-mysql -o json | jq .status.podIP
- oc exec -it mysqlclient -- mysqlshow -u redhat -p -h <ip-address>
- 