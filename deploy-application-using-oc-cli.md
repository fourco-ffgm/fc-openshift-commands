# Deploy application using OC CLi

```bash
oc new-app –i mysql \
-e MYSQL_USER=user –e MYSQL_PASSWORD=pass \
-e MYSQL_DAYABASE=testdb -l db=mysql
```

- oc status.
- oc get pods.
- oc describe pod <pod-name>

