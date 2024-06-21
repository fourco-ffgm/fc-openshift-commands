# Exercise: Troubleshoot Containers and Pods

```bash
Run oc run mysql-server \
--image docker.io/lmsantosopenshift/mysql-80:1228 \
--env MYSQL_USER=redhat \
--env MYSQL_PASSWORD=redhat123 \
--env MYSQL_DATABASE=world
```

- oc get pods
- oc logs mysql-server
- oc get events
- skopeo inspect docker://docker.io/lmsantosopenshift/mysql-80
- oc edit pod/mysql-server
- oc cp world_x.sql mysql-server:/tmp/
- oc exec -it pods/mysql-server -- ls -la /tmp
- oc rsh mysql-server
- mysql -u redhat –p --> enter redhat123
- USE world;
- SOURCE /tmp/world_x.sql;
- SHOW tables;
- oc port-forward mysql-server 3306:3306
- oc rsh mysql-server
- mysql -u redhat -p -h 127.0.0.1 -P 3306  enter redhat123
- USE world;
- show tables;
- SELECT COUNT(*) FROM country;
- exit
- 