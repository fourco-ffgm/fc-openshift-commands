# Exercise: Create Linux Containers and Kubernetes Pods

Needs to be executed in an environment with access to a developer and admin user.

- oc describe project pods-containers
  
```bash
oc run -it ubi9-user --restart 'Never' \
--image redhat/ubi9 \
-- /bin/bash -c "whoami && id"
```

- oc delete pod ubi9-user

```bash
oc run -it ubi9-user --restart 'Never' \
--image redhat/ubi9 \
-- /bin/bash -c "whoami && id”
```

- oc delete pod ubi9-user
- oc run ubi9-date --restart 'Never' \ --image redhat/ubi9 -- date
- oc logs ubi9-date
- oc delete pod ubi9-date
- while true; do echo $(date); sleep 2; done
- oc run ubi9-command -it --image ubi9/ubi -- /bin/bash
- oc logs ubi9-command
- oc attach ubi9-command --it

```bash
oc get pod ubi9-command -o json | \
jq .status.containerStatuses[].name
```

- oc get pods ubi9-command -o wide
- oc debug node/master0
- oc debug node/master0
- crictl ps --name ubi9-command -o json | jq -r .containers[0].id
- CID=$(crictl ps --name ubi9-command -o json | jq -r .containers[0].id)
- crictl inspect $CID | grep pid and get the PID
- PID=658678
- lsns –p $PID
- cat /etc/redhat-release
- crictl exec -it $CID cat /etc/redhat-release
- ldd --version
- crictl exec -it $CID ldd –version